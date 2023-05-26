import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_browser_client.dart' as mqtt;
import 'package:geolocator/geolocator.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:typed_data/src/typed_buffer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enviar Localização',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Enviar Localização'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({super.key, required this.title});

  final Geolocator geolocator = Geolocator();
  final mqtt.MqttBrowserClient client =
     //assim que subir o integrator mudar o host ***
      mqtt.MqttBrowserClient('ws://localhost:1886', '');

  Future<void> connectAndPublishLocation() async {
    client.port = 1883;

    try {
      await client.connect();
      print('Conectado ao servidor MQTT');

      Position position = await Geolocator.getCurrentPosition();

      client.publishMessage(
          'localizacao', 0 as MqttQos, position.toString() as Uint8Buffer); // Nível de QoS: 0

       client.disconnect();
      print('Desconectado do servidor MQTT');
    } catch (e) {
      print('Erro ao conectar ao servidor MQTT: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: connectAndPublishLocation,
          child: const Text('Enviar Localização'),
        ),
      ),
    );
  }
}
