# Peliculas App Fluter

Aplicación hecha con el fin de aprender sobre widgets y funciones básicas en flutter, la aplicación consta de 3 pantallas para ver una breve información sobre películas, la información de las películas es obtenida de las [API de The Movie DB](https://developers.themoviedb.org/3/getting-started/introduction).

## Caracteristicas 
* **Películas recientes y populares**
  * Carrusel de imagenes: Se muestran las películas más recientes.
  * Lista horizontal de imagenes: Muestra las películas más populares.

<p  align="center">
  <img src="https://github.com/B3rert/peliculas_flutter_app/blob/master/assets/screenshots/Screenshot_20220119-155451.jpg?raw=true" width="30%" >
</p>

* **Barra de búsqueda**
  * Muestra las películas que coincidan con el texto ingresado.
  
<p  align="center">
  <img src="https://github.com/B3rert/peliculas_flutter_app/blob/master/assets/screenshots/Screenshot_20220119-155542.jpg?raw=true" width="30%" >
</p>

* **Detalles de las peliculas**
  * Al hacer click en cualquiera de las películas se muestra una nueva pantalla con la descripción de las películas, actores y otros datos.

<p  align="center">
  <img src="https://github.com/B3rert/peliculas_flutter_app/blob/master/assets/screenshots/Screenshot_20220119-155457.jpg?raw=true" width="30%" >
</p>


## Notas
**Errrores conocidos:**
* La barra de búsqueda puede presentar problemas si se deja el campo de texto vacío.
* El carrusel de imágenes de las películas actuales no funciona de forma correcta haciendo que al querer pasar una imagen muestre otra por encima refrescando el widget.

Debido a que es una practica de flutter no hay prioridad en resolver los problemas, sin embargo se espera solucionarlos proximamente.

## Ejecutar el proyecto
1. Clonar el repositorio.
2. Descargar las dependencias, en la terminal ejecutar `flutter packages get`
