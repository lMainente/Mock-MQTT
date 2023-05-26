# MQTT - Maps


## Projeto De Teste Protocolo MQTT + Flutter(mobile) + Cassandra + PHP(Web)

1. Configurar um servidor MQTT: Você precisará configurar um servidor MQTT que será responsável por receber os dados de localização do celular neste caso foi usado mosquitto
2. Desenvolver um aplicativo móvel: Desenvolva um aplicativo móvel para capturar a localização em tempo real do celular. Integre o aplicativo com a biblioteca MQTT para enviar os dados de localização para o servidor MQTT configurado.
3. Configurar a aplicação PHP: Configure a aplicação PHP que receberá os dados de localização do servidor MQTT. Utilize a biblioteca MQTT no lado do servidor para se inscrever nos tópicos relevantes e processar as mensagens MQTT recebidas. Em seguida, armazene as informações de localização no Cassandra utilizando a biblioteca oficial para PHP (https://github.com/thobbs/phpcassa).
4. Exibir dados em uma tela: Crie uma interface de usuário em PHP para exibir os dados de localização em tempo real. Utilize HTML, CSS e JavaScript para construir a página web. Você pode utilizar bibliotecas de visualização de mapas, como o Leaflet ou o Google Maps, para exibir as coordenadas de localização em um mapa interativo.
