class LearningDecay:
    """Atualiza a taxa de aprendizado, eta, a uma taxa "eta_decay" exponencial.
    """
    def __init__(
        self, epochs_wait_improvement:int, eta_decay:float, number_decays:int
        ) -> None:
        assert 0 < eta_decay < 1
        self.epochs_wait_improvement = epochs_wait_improvement
        self.eta_decay = eta_decay
        self.number_exec = number_decays
        self.execution = 0
    
    def network_not_learning(self, epochs_since_improvement:int) -> bool:
        return epochs_since_improvement >= self.epochs_wait_improvement

    def get_new_eta(self, eta:float) -> float:
        """Retorna o novo eta decrescido. Caso já tenha excedido o número de execuções,
        em vez diso retorna -1.
        """
        if self.execution >= self.number_exec:
            return -1
        self.execution += 1
        return eta * self.eta_decay