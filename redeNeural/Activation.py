import numpy as np
#np.seterr(all = "raise")


# ESTE ARQUIVO É DESTINADO AS FUNÇÕES DE ATIVAÇÃO


class Activation:
    @staticmethod
    def function(z : np.array) -> np.array:
        pass

    @staticmethod
    def derivative(z : np.array) -> np.array:
        pass

class Sigmoid(Activation):
    @staticmethod
    def function(z : np.array) -> np.array:
        return 1/(1 + np.exp(-z))

    @staticmethod
    def derivative(z : np.array) -> np.array:
        e_menos = np.exp(-z)
        return e_menos / (1 + e_menos)**2

class Tanh(Activation):
    @staticmethod
    def function(z : np.array) -> np.array:
        e_mais = np.exp(z)
        e_menos = np.exp(-z)
        return (e_mais - e_menos) / (e_mais + e_menos)

    @staticmethod
    def derivative(z : np.array) -> np.array:
        return  1 / np.cosh(z)**2

class ReLU(Activation):
    @staticmethod
    def function(z : np.array) -> np.array:
        return np.where(z >= 0, z, 0)

    @staticmethod
    def derivative(z : np.array) -> np.array:
        return  np.where(z >= 0, 1, 0)


class Softmax(Activation):
    @staticmethod
    def function(z : np.array) -> np.array:
        e = np.exp(z)
        return e/np.sum(e)

    @staticmethod
    def derivative(z : np.array) -> np.array:
        s = Softmax.function(z)
        return s * (1 - s)