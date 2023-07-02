import requests


def get_distancia_ceps(cep_origem:str, cep_destino:str) -> float:
    url = f"http://localhost:8080/cep?cepOrigem={cep_origem}&cepDestino={cep_destino}"

    try:
        response = requests.get(url)
    except:
        return None
    
    if response.status_code == 200:
        distancia_str = response.text
        
        if distancia_str == 'Não localizado':
            return None
        
        # Remove km e vírgula de separador
        distancia_str = distancia_str.replace(" km", "")
        distancia_str = distancia_str.replace(",", "")
        try:
            distancia = float(distancia_str)
        except:
            return None
        return distancia
    else:
        return None


def get_distancia_lat_long(lat_origem:str, long_origem:str, lat_destino:str, long_destino:str) -> float:
    url = f"http://localhost:8080/latlong?latOrigem={lat_origem}&lngOrigem={long_origem}&latDestino={lat_destino}&lngDestino={long_destino}"

    try:
        response = requests.get(url)
    except:
        return None
    
    if response.status_code == 200:
        distancia_str = response.text
        
        if distancia_str == 'Não localizado':
            return None
        
        # Remove km e vírgula de separador
        distancia_str = distancia_str.replace(" km", "")
        distancia_str = distancia_str.replace(",", "")
        try:
            distancia = float(distancia_str)
        except:
            return None
        return distancia
    else:
        return None