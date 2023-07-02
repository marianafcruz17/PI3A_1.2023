import numpy as np

# ESTE ARQUIVO É DESTINADO AS REGULARIZAÇÕES


class RegularFunc:
    def __init__(self, eta:float, lmbda:float) -> None:
        self.eta = eta
        self.lmbda = lmbda
    
    def custo_regular(self, data:list, weights:list) -> float:
        pass
    
    def grad(self, w:list, N:int) -> np.ndarray:
        """Retorna a componente do gradiente que diz respeito a regularização.
        No caso em que não há regularização, é simplesmente retornado o peso, 
        em que este será modificado na direção contrária ao gradiente pela função
        chamante.

        Args:
            w (list): Weights
            N (int): Tamanho do Dataset
        """
        pass

    def set_eta(self, eta:float) -> None:
        self.eta = eta


class L2(RegularFunc):
    def custo_regular(self, data:list, weights:list) -> float:
        return 0.5*(self.lmbda/len(data)) * sum(
            np.linalg.norm(w)**2 for w in weights)
        
    def grad(self, w:list, N:int) -> np.ndarray:
        return (1 - self.eta * self.lmbda / N) * w


class L1(RegularFunc):
    def custo_regular(self, data:list, weights:list) -> float:
        return self.lmbda/len(data) * sum(
            np.sum(np.abs(w)) for w in weights)
        
    def grad(self, w:list, N:int) -> np.ndarray:
        return w - (self.eta * self.lmbda / N) * np.sign(w)


class Nothing(RegularFunc):
    """Caso não haja regularização escolhida
    """
    def custo_regular(self, data:list, weights:list) -> float:
        return 0.0
    
    def grad(self, w:list, N:int) -> np.ndarray:
        return w