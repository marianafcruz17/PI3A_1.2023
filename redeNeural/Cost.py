import numpy as np
from Activation import Sigmoid, Softmax
from Regularization import RegularFunc


# ESTE ARQUIVO É DESTINADO AS FUNÇÕES CUSTO


class CostFunction:
    def __init__(self, regular:RegularFunc, eta:float, lmbda:float) -> None:
        self.regular = regular
        self.eta = eta
        self.lmbda = lmbda
    
    
    def get_custo(self, a:np.ndarray, y:np.ndarray) -> float:
        """Retorna o custo associado com a ativação da útlima camada
        """
        pass
    
    def get_last_layer_activation(self, b:np.ndarray, w:np.ndarray, a:np.ndarray) -> tuple:
        pass
    
    def total_cost(self, func_feedforward, data:list, weights:list) -> float:
        cost = 0.0
        
        for x, y in data:
            a = func_feedforward(x)
            cost += self.get_custo(a, y)
        cost /= len(data)
        
        cost += self.regular.custo_regular(data, weights)
        return cost
        
    
    def get_erro_delta(self, z:np.ndarray, a:np.ndarray, y:np.ndarray) -> np.ndarray:
        """Retorna o erro delta relacionado a última camada."""
        pass
    
    def weights_adjust_grad(
        self, weights:list, partial_w:list,
        batch_size:int, N : int) -> list:
        
        return [self.regular.grad(w, N) - self.eta/batch_size * p_w 
                        for w, p_w in zip(weights, partial_w)]
    
    def biases_adjust_grad(
        self, biases:list, partial_b:list,
        batch_size:int) -> list:
        
        return [b - self.eta/batch_size * p_b 
                       for b, p_b in zip(biases, partial_b)]

    def set_eta(self, eta:float) -> None:
        self.eta = eta


class Quadratic(CostFunction):
    
    def get_custo(self, a_L:np.ndarray, y:np.ndarray) -> float:
        return (np.linalg.norm(a_L - y)**2)/2
    
    def get_last_layer_activation(self, b:np.ndarray, w:np.ndarray, a:np.ndarray) -> tuple:
        z = np.dot(w, a) +  b
        a_L = Sigmoid.function(z)
        return z, a_L

    def get_erro_delta(self, z_L:np.ndarray, a_L:np.ndarray, y:np.ndarray) -> np.ndarray:
        return (a_L - y) * Sigmoid.derivative(z_L)


class CrossEntropy(CostFunction):
    # Erro Delta criado para acelarar o aprendizado da função de ativação sigmoide
    
    def get_custo(self, a_L:np.ndarray, y:np.ndarray) -> float:
        # Há um método especial que lida com valores invalidos:
        # nan -> 0
        # +inf -> maior float possível
        return np.sum(np.nan_to_num(-y * np.log(a_L) - (1 - y) * np.log(1 - a_L)))
    
    def get_last_layer_activation(self, b:np.ndarray, w:np.ndarray, a:np.ndarray) -> tuple:
        z = np.dot(w, a) +  b
        a_L = Sigmoid.function(z)
        return z, a_L
    
    def get_erro_delta(self, z_L:np.ndarray, a_L:np.ndarray, y:np.ndarray) -> np.ndarray:
        return a_L - y


class LogLikehood(CostFunction):
    # Erro Delta criado para acelarar o aprendizado da função de ativação softmax
    
    def get_custo(self, a_L:np.ndarray, y:np.ndarray) -> float:
        i = y.argmax()
        return np.nan_to_num(-np.log(a_L[i]))
    
    def get_last_layer_activation(self, b:np.ndarray, w:np.ndarray, a:np.ndarray) -> tuple:
        z = np.dot(w, a) +  b
        a_L = Softmax.function(z)
        return z, a_L
    
    def get_erro_delta(self, z_L:np.ndarray, a_L:np.ndarray, y:np.ndarray) -> np.ndarray:
        return a_L - y