Esta prueba consta de dos desafios:

DESAFIO 1:

Una aplicación web simple que permite  obtener el precio actual de acciones ingresando sus símbolos. La aplicación está hecha con Python y Flask, y utiliza la API de Alpha Vantage (podría ser cualquier otra API)

para poder hacer uso de la aplicación se deben seguir los siguientes pasos:

1. clonar el positorio https://github.com/hsaenzg11/prueba-devops-carvajal.git
2. una vez clonado, ingresar a la carpeta app/
3. dentro de la carpeta se encuentra el codigo fuente y archivos necesarios para la ejecución de la aplicación
4. ejecutar el script ./script.sh, el cual hará el buid de la imagen de docker, y el respectivo despliegue localmente. Al final de la ejecución nos mostrará cómo acceder a la aplicación web.
5. La imagen de docker fue almacenada en docker hub, en el siguiente link https://hub.docker.com/repository/docker/hsaenz11/stock_app/general
6. ingresar los simbolos de la o las acciones que desea consulta, recuerde que si es mas de una debe separarlos por comas.


DESAFIO 2:

Dentro del mismo repositorio se encuentra una carpeta terraform, con los archivos de configuración con los cuales se llevó a cabo el despliegue de la red vpc, las subnets (publicas, y privadas), el internet gateway.

Adicionalmente se agrega en el repositorio el diagrama con lo que se desplegó (diagrama.drawio.png)