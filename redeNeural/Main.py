from Network import Network
import numpy as np
from GetDistanciaEnderecos import get_distancia_lat_long
import os


class RedeNeuralCalibrada:
    def __init__(self) -> None:
        self.rede = Network.load("MelhorRede.json")
        
        # Media e Desvio da distancia, para escala
        self.mean = 111.95658333333333
        self.std = 374.58011580078085
        
        # Inicia a API do Google
        os.startfile(r"ApiLatLong.exe")
    
    def calcula_recomendacoes(self, jsons:list) -> None:
        """Calcula a flag "recomendacao" de cada um dos restaurantes

        Args:
            jsons (list[dict]): É uma lista, cujo cada um dos itens são os dados do usuário
            e do restaraunte. Também contem a recomendação do restaurante (true ou false).
        """
        
        
        for registro in jsons:
            
            # Parametros da rede
            latitude_user = registro["latitude_user"]
            longitude_user = registro["longitude_user"]
            lactose_user = registro["lactose_user"]
            gluten_user = registro["gluten_user"]
            vegetariano_user = registro["vegetariano_user"]
            porco_user = registro["porco_user"]
            latitude_rest = registro["latitude_rest"]
            longitude_rest = registro["longitude_rest"]
            lactose_rest = registro["lactose_rest"]
            gluten_rest = registro["gluten_rest"]
            vegetariano_rest = registro["vegetariano_rest"]
            porco_rest = registro["porco_rest"]
            
            # Calcula distancia, o parametro adicional
            distancia = get_distancia_lat_long(
                latitude_user, longitude_user,
                latitude_rest, longitude_rest
            )
            registro["distancia"] = distancia
            
            # Escala a distancia
            distancia_scale = (distancia - self.mean)/self.std
            
            # Prepara input
            x = np.array([
                lactose_user, gluten_user, vegetariano_user, porco_user,
                lactose_rest, gluten_rest, vegetariano_rest, porco_rest,
                distancia_scale
            ], np.float64).reshape(-1, 1)
            
            # Calcula output
            ativacao = self.rede.feedforward(x)
            y = bool(np.argmax(ativacao))
            
            # Salva resultado
            registro["recomendacao"] = y

        # Exibe o primeiro restaurante
        print("\n{")
        for k, v in jsons[0].items():
            print(f"{k} : {v}")
        print("}\n")


# if __name__ == "__main__":
#     rede = RedeNeuralCalibrada()
#     jsons = [
#         {
#       "id": "1",
      
#       "latitude_rest": -15.87397,
#       "longitude_rest": -47.96952,
      
#       "latitude_user": -15.97397,
#       "longitude_user": -47.96952,
      
#       "name": "Sabor e Arte",
      
#       "lactose_user" : False,
#       "gluten_user" : True,
#       "vegetariano_user" : True,
#       "porco_user" : False,      
      
#       "lactose_rest" : False,
#       "gluten_rest" : True,
#       "vegetariano_rest" : True,
#       "porco_rest" : False,

#       "cardapio":"http",
#       "recomendado":True,
#       "distancia":"1.6"
      
#     }
#     ]
#     rede.calcula_recomendacoes(jsons)