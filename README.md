# perfecto

## acerca de

software programado y diseñado por aarón montoya-moraga y guillermo montecinos

comisionado por maría josé contreras

v0.0.1

## software y hardware

este software corre en un macbook, con processing 3 instalado y la biblioteca de processing ipcapture instalada

 hasta 3 iphones transmitiendo video usando la app ipcamera




## instrucciones

* descargar y abrir ipcamera en cada iphone

 ![app](https://github.com/montoyamoraga/perfecto/raw/gh-pages/pics/ipcamera.png "app ipcamera")

* crear red local desde macbook, usar

![network](https://github.com/montoyamoraga/perfecto/raw/gh-pages/pics/network.png "create network")

![name](https://github.com/montoyamoraga/perfecto/raw/gh-pages/pics/name.png "network name")

* conectar cada iphone a la red creada

![iphone](https://github.com/montoyamoraga/perfecto/raw/gh-pages/pics/iphone.png "iphone")

* tomar nota de la ip de cada iphone, desde la app ipcamera

![ip_iphone](https://github.com/montoyamoraga/perfecto/raw/gh-pages/pics/ip_iphone.png "ip_iphone")

* tomar nota de la ip del macbook, ingresando a wifi, preferencias de red

![name](https://github.com/montoyamoraga/perfecto/raw/gh-pages/pics/preferences.png "preferences")

![ip_macbook](https://github.com/montoyamoraga/perfecto/raw/gh-pages/pics/ip_macbook.png "ip_macbook")

* confirmar que iphones y macbook estén en la misma red, las ip son cuatro números entre 0 y 255, si los dos primeros números son iguales en todos los dispositivos, todo está bien, si no, confirmar que estén todos en la misma red

* abrir el sketch de processing en el macbook

* reemplazar las ip del sketch por las de los iphones

  ![p5](https://github.com/montoyamoraga/perfecto/raw/gh-pages/pics/ip_p5.png "p5")

* ejecutar el sketch de processing
* con las teclas 1, 2, 3 del macbook se puede activar o desactivar la muestra de cada iphone
* se puede detener la transmisión con la tecla m
* se puede reanudar la transmisión con la tecla n
* si un iphone sale y vuelve a entrar de la app ipcamera, es necesario
presionar "n" para reanudar, o "m" y "n" para resetear
* no olvidar conectar el macbook al proyector
* si se monta todo de nuevo, usar un nuevo nombre de red local y repetir todos los pasos

## agradecimientos

* processing foundation, por su hermoso software
* app ipcamera por ahorrarnos trabajo
* colo-colo, por existir


## por hacer

en ios11, todavía no lanzado habrá soporte para webrtc y la aplicación migrará a correr en safari tanto en el macbook como en los iphone
