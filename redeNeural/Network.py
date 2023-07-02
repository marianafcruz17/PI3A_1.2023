from __future__ import annotations
import json
import sys
import numpy as np
import random
import Activation as Activation
import Cost as Cost
import Regularization as Regularization
from LearningDecay import LearningDecay



# EXPLICAÇÃO DO PROGRAMA
#
# OBJETIVO
# Classificar corretamente os digitos escritos a mão presentes no Dataset MNIST.
# Foi usado somente o "mnist_train.csv", em seguida ele foi dividido em treino e em teste.
#
# ALGORITMO
# Aplica o Stochastic Gradient Descent (SGD) para fazer a rede neural aprender de forma
# rápida e efetiva. Todos os neurônios da rede são do tipo sigmoide.
#
# A classe Network faz todo o trabalho de aprendizado. Para inicializá-la é passado alguns
# parâmetros explicados abaixo:
# - mini_batch_size : Tamanho de cada batch (lote) do input, avaliado no SGD
# - eta : Taxa de aprendizado
# - epochs: Número de vezes que todos os dados de input são lidos, i.e., todos os baches



np.random.seed(0)
random.seed(0)




# =====================================================================
#                                                                     |
#                              REDE NEURAL                            |
#                                                                     |
#======================================================================

class Network:
    def __init__(
        self, sizes : list,
        cost_class : Cost.CostFunction = Cost.CrossEntropy,
        regular_class : Regularization.RegularFunc = Regularization.L2,
        activation : Activation = Activation.Sigmoid
        ) -> None:
        
        self.num_layers = len(sizes)
        self.sizes = sizes
        
        
        self.biases : list
        self.weights : list
        # Cada camada, exceto a input, vão ter seu respectivo weight e bias.
        # Eles podem ser acessados conforme segue:
        # [i_camada][i_neuronio]
        self.best_biases : list
        self.best_weights : list
        
        # Inicializa weights e bias
        self.parameter_initializer()
        
        # Definições adicionais
        self.cost_class = cost_class
        self.regular_class = regular_class
        self.activation = activation
        self.cost : Cost.CostFunction
        self.regular : Regularization.RegularFunc

    def parameter_initializer(self) -> None:
        """Inicializa os biases como 0 e o weights com uma distribuição normal
        com desvio de "1/sqrt(N)", com N sendo o numero de neurônios na camada
        anterior.
        Assim, numa situação em que todos os inputs de um neurônio sejam "1" ou
        "-1", o weighted input vai somar "1" ou "-1", em média. Isso quer dizer
        que o neurônio (sigmoide) não começará saturado.
        """
        self.biases = [np.zeros((y, 1), np.float64) for y in self.sizes[1:]]
        self.weights = [np.random.randn(y, x)/np.sqrt(x)
                        for x, y in zip(self.sizes[:-1], self.sizes[1:])]
        self.save_best_set_parameters()
        

    def save_best_set_parameters(self) -> None:
        """Guarda os biases e weights atuais. Usado para guardar o melhor
        resultado
        """
        self.best_biases = [b.copy() for b in self.biases]
        self.best_weights = [w.copy() for w in self.weights]
        

    def load_best_set_parameters(self) -> None:
        """Carrega os melhores weights e biases para a rede atual"""
        self.biases = [b.copy() for b in self.best_biases]
        self.weights = [w.copy() for w in self.best_weights]
    
    
    def feedforward(self, a:np.array) -> np.array:
        # a: n linhas e 1 coluna
        # Começa como a entradas da primeira coluna.
        
        for w, b in zip(self.weights[:-1], self.biases[:-1]):
            a = self.activation.function(w.dot(a) + b)
        
        z, a = self.cost.get_last_layer_activation(
            self.biases[-1], self.weights[-1], a)
        
        return a


    def SGD(self, train_data:list, epochs:int, mini_batch_size:int, eta:float,
            lmbda:float = 0.0,
            test_data:list=None,
            learning_decay : LearningDecay = None,
            monitor_train_cost=False,
            monitor_train_accuracy=False,
            monitor_test_cost=False,
            monitor_test_accuracy=False) -> None:
        """
        ARGS
        
        train_data: Lista de tuplas "(x, y)" com as features e classes.
        
        epochs: Numero de vezes que os dados de treino são processados
        
        mini_batch_size: Os dados de treino são divididos em seções desse tamanho.
        Cada seção processada faz a calibragem dos parâmetros da rede.
        
        test_data: Dados de teste, opcional e são avaliados a cada epoch, i.e., 
        cada vez que processar todos os dados de treino.
        
        RETURNS
        
        """
        
        self.regular : Regularization.RegularFunc = self.regular_class(eta, lmbda)
        self.cost : Cost.CostFunction = self.cost_class(self.regular, eta, lmbda)
        
        N = len(train_data)
        test_costs, test_accuracies = [], []
        train_costs, train_accuracies = [], []
        
        epochs_since_improvement = 0
        best_accuracy = -np.inf
        errors_on_best = []
        best_epoch = 0 
        
        for j in range(epochs):
            # Embaralha os dados de treino
            random.shuffle(train_data)
            
            # Secciona os dados de treino em subarrays de tamanho "mini_batch_size"
            mini_batches = [
                train_data[k : k + mini_batch_size]
                for k in range(0, N, mini_batch_size)
            ]
            
            # Usa cada um dos subarrays para calibrar a rede, com base na
            # taxa de aprendizado "eta"
            for mini_batch in mini_batches:
                self.update_mini_batch(mini_batch, eta, lmbda, N)
            print(f"Epoch {j} complete")
            
            
            if monitor_train_cost:
                cost = self.total_cost(train_data)
                train_costs.append(cost)
                print(f"Cost on training data: {cost}")
                
            if monitor_train_accuracy:
                accuracy_str, accuracy, errors = self.get_accuracy(train_data)
                train_accuracies.append(accuracy)
                print(f"Accuracy on training data: {accuracy_str}")
                
            if monitor_test_cost:
                cost = self.total_cost(test_data)
                test_costs.append(cost)
                print(f"Cost on test data: {cost}")
            
            # Test accuracy
            accuracy_str, test_accuracy, errors = self.get_accuracy(test_data)
            test_accuracies.append(test_accuracy)
            if monitor_test_accuracy:
                print(f"Accuracy on test data: {accuracy_str}")
            
            
            # Check Improvement
            if test_accuracy > best_accuracy:
                epochs_since_improvement = 0
                self.save_best_set_parameters()
                best_accuracy = test_accuracy
                best_epoch = j
                errors_on_best = errors
            else:
                epochs_since_improvement += 1
            
            
            # Learning Rate Decay
            # Reduz o eta caso não esteja aprendendo
            if learning_decay is not None:
                
                # Atingiu o limite
                if learning_decay.network_not_learning(epochs_since_improvement):
                    new_eta = learning_decay.get_new_eta(eta)
                    
                    # Já redefiniu o eta muitas vezes, sai do programa
                    if new_eta < 0:
                        print(
                            f"Learning Rate Decay limit arrived."
                        )
                        break
                    
                    # Do contrário, redefine eta
                    print(
                        f"No improviment for {epochs_since_improvement} epochs\n"
                        f"Redefine η {eta} -> {new_eta}\n"
                        f"Load Epoch {best_epoch} {best_accuracy:.2f}%"
                    )
                    
                    # Carrega o melhor cenário com o antigo eta
                    self.load_best_set_parameters()
                    
                    # Redefine o novo eta para toda rede
                    eta = new_eta
                    self.regular.set_eta(new_eta)
                    self.cost.set_eta(new_eta)
                    
                    # Zera o contador
                    epochs_since_improvement = 0
        
        
        
        print("Errors")
        for i, (x, y, ativacao) in enumerate(errors_on_best, 1):
            print(f"Error {i}")
            print(f"{x = }")
            print(f"{y = }")
            print(f"{ativacao = }")
            print()
        
        print(
            f"Best Epoch {best_epoch} {best_accuracy:.2f}%"
        )
        
        return (
            test_costs, test_accuracies, train_costs, train_accuracies
        )



    def update_mini_batch(self, mini_batch:list, eta:float, lmbda:float, N:int) -> None:
        """Recebe o subconjunto do input "mini_batch", então calibra o gradiente
        baseado nessa pequena amostra. Após calcular, atualiza os parâmetros da rede."""
        
        # Derivada parcial do batch inteiro, i.e., a média das derivadas parciais
        partial_b = [np.zeros(b.shape) for b in self.biases]
        partial_w = [np.zeros(w.shape) for w in self.weights]
        
        for x, y in mini_batch:
            # Derivada parcial do input x
            partial_bx, partial_wx = self.backprop(x, y)
            
            # Soma a deriviada do batch inteiro
            partial_b = [p_b + p_bx for p_b, p_bx in zip(partial_b, partial_bx)]
            partial_w = [p_w + p_wx for p_w, p_wx in zip(partial_w, partial_wx)]
            
        self.weights = self.cost.weights_adjust_grad(self.weights, partial_w, len(mini_batch), N)
        self.biases = self.cost.biases_adjust_grad(self.biases, partial_b, len(mini_batch))


    def backprop(self, x:list, y:list) -> tuple:
        """Determina o gradiente dos biases e weights dado um input x."""
        
        partial_b = [np.zeros(b.shape) for b in self.biases]
        partial_w = [np.zeros(w.shape) for w in self.weights]
        
        # FEEDFORWARD
        
        # Ativação (output de cada camada)
        # Primeira ativação é o input
        a = x 
        activations = [x]
        
        # Todos os weighted input, z = w . a + b
        zs = []
        
        # Algoritmo
        for w, b in zip(self.weights[:-1], self.biases[:-1]):
            z = np.dot(w, a) +  b
            zs.append(z)
            a = self.activation.function(z)
            activations.append(a)
        
        z, a = self.cost.get_last_layer_activation(self.biases[-1], self.weights[-1], a)
        zs.append(z)
        activations.append(a)
        
        
        # BACKPROPAGATION
        
        # O primeiro delta é calculado pela primeira formula da backpropagation
        delta = self.cost.get_erro_delta(zs[-1], activations[-1], y)
        partial_b[-1] = delta
        partial_w[-1] = np.dot(delta, activations[-2].transpose())
        
       # Calcula os demais deltas
       # Como o numero de camadas conta a camada input, então o algoritmo abaixo
       # está correto
        for l in range(-2, -self.num_layers, -1):
            z = zs[l]
            delta = np.dot(self.weights[l + 1].transpose(), delta) * self.activation.derivative(z)
            
            partial_b[l] = delta
            partial_w[l] = np.dot(delta, activations[l - 1].transpose())
            
        return (partial_b, partial_w)


    def get_accuracy(self, test_data:list) -> tuple:
        """Determina a precisão da rede baseado nos dados de teste de entrada.
        Para a ativação da última camada, a rede considera a predição como sendo
        o neurônio com maior valor.
        """
        
        acertos = 0
        total = len(test_data)
        errors = []
        
        for (x, y) in test_data:
            ativacao = self.feedforward(x)
            
            neuronio_predicao = np.argmax(ativacao) # Ativacao com maior valor vai ser o neuronio predico
            neuronio_correto = np.argmax(y)
            
            if neuronio_predicao == neuronio_correto:
                acertos += 1
            else:
                errors.append((x, y, ativacao))
        
        accuracy = acertos / total * 100
        accuracy_str = f"{acertos} / {total} {accuracy :.2f}%"
        return accuracy_str, accuracy, errors


    def total_cost(self, data:list) -> float:
        return self.cost.total_cost(
            self.feedforward, data, self.weights)

    def save(self, nome_arquivo:str) -> None:
        """Salva a rede no arquivo.
        """
        data = {
            "sizes": self.sizes,
            "weights": [w.tolist() for w in self.weights],
            "biases": [b.tolist() for b in self.biases],
            "cost": str(self.cost.__class__.__name__),
            "regular": str(self.regular.__class__.__name__),
            "activation": str(self.activation.__name__),
        }
        
        with open(f"{nome_arquivo}.json", "w") as saida:
            json.dump(data, saida)
    
    def load(nome_arquivo:str) -> Network:
        with open(nome_arquivo, "r") as entrada:
            data = json.load(entrada)
        
        sizes = data["sizes"]
        cost_class = getattr(sys.modules['Cost'], data["cost"])
        regular_class = getattr(sys.modules['Regularization'], data["regular"])
        activation = getattr(sys.modules['Activation'], data["activation"])
        weights = [np.array(w, dtype = np.float64) for w in data["weights"]]
        biases = [np.array(b, dtype = np.float64) for b in data["biases"]]

        network = Network(sizes, cost_class, regular_class, activation)
        network.weights = weights
        network.biases = biases
        network.save_best_set_parameters()
        
        # Preenchendo com qualquer dado, nao faz diferenca
        network.regular : Regularization.RegularFunc = network.regular_class(eta = 0.0, lmbda = 0.0)
        network.cost : Cost.CostFunction = network.cost_class(network.regular, eta = 0.0, lmbda = 0.0)
        
        return network