import paho.mqtt.client as mqtt

def on_connect(client, userdata, flags, rc):
    print("Cliente conectado: " + str(client))

def on_message(client, userdata, msg):
    print("Mensagem recebida: " + msg.topic + " " + str(msg.payload))

def on_publish(client, userdata, mid):
    print("Mensagem publicada: " + str(mid))

def on_subscribe(client, userdata, mid, granted_qos):
    print("Cliente inscrito: " + str(mid))

def on_log(client, userdata, level, buf):
    print("Log: " + buf)

mqtt_server = mqtt.MQTTServer("207.244.238.40")
mqtt_server.on_connect = on_connect
mqtt_server.on_message = on_message
mqtt_server.on_publish = on_publish
mqtt_server.on_subscribe = on_subscribe
mqtt_server.on_log = on_log

mqtt_server.start()
000