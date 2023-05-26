# Rodar mosquitto -p 1883 na pasta de install /ou aguardar servidor configurado

import paho.mqtt.client as mqtt


def on_connect(client, userdata, flags, rc):
    print("Conectado. Código de resultado: " + str(rc))
    client.subscribe("localizacao")

def on_message(client, userdata, msg):
    print("Mensagem recebida: " + msg.payload.decode())

def on_disconnect(client, userdata, rc):
    if rc != 0:
        print("Desconexão inesperada. Código de resultado: " + str(rc))

def connect_mqtt():
    client = mqtt.Client()
    client.on_connect = on_connect
    client.on_message = on_message
    client.on_disconnect = on_disconnect

  # to-do assim q subir o py no integrator mudar o host
    host = "ws://localhost"
    port = 1883
    client.connect(host, port, 60)

    return client

if __name__ == '__main__':
    mqtt_client = connect_mqtt()
    mqtt_client.loop_start()
