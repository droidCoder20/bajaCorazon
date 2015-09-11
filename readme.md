## Proyecto Baja de Corazon

Baja de corazon es una aplicacion para llevar el control de asistencia en alumnos.
 
### Primeros pasos

1. Instalar Node js
2. Instalar npm
3. Run npm install
4. Run bower install
5. Run gulp watch y ta da! El proyecto esta configurado

### Tareas de Gulp

1. gulp default --> Ejecuta todas las tareas en el orden en que estan en el archivo gulpfile.js
2. gulp tdd     --> Ejecuta tests (Aun no esta implementado)
3. gulp watch   --> Ejecuta todas las tareas y se queda en watch para todas, refrescando el navegador en cada cambio I Love Browser Sync <3
4. gulp (imagemin, stylus, coffee, jade, jshint, elixir-connect) --> Ejecuta una sola tarea, estas estan definidas en gulpfile.js

Para informacion acerca de los modulos de laravel elixir visita:

https://www.npmjs.com/search?q=laravel-elixir

### Distribucion de directorio

El proyecto tiene la estrcutura proporcionada por Laravel, solo se modificaron algunas
por la necesidad de laravel-elixir.

1. ./app/ --> Backend (PHP)
2. ./bootstrap/ --> Laravel Folder
3. ./config/ --> Laravel Folder
4. ./database/ --> Base de datos
5. ./node_modules/ --> modulos npm
6. ./public/ --> Recursos entregados al navegador
7. ./public/js/vendor --> Bower vendor
8. ./resources/assets --> Directorio de archivos que seran compilados y depositados en su carpeta public relacionado
9. ./resources/jade --> templates jade
10. ./resources/view --> carpeta destino de compilacion de los template jade
11. ./test/ --> Test folder
12. ./vendor/ --> Laravel vendor
13. ./.bowerrc --> Archivo con opciones de bower
14. ./jshintrc --> Reglas de codificacion para Javascript
15. ./bower.json --> Archivo con dependencias para UI
16. ./gulpfile.js --> Archivo de configuracion de gulp (Utiliza laravel-elixir)
17. ./package.json --> Archivo con dependencias principalmente de Laravel-elixir y Gulp
18. ./server.php --> Configuracion de server

### IDE

Si vas a utilizar PhpStorm, WebStorm o de esta familia, sigue los siguientes pasos para utilizar el archivo de JSHint
cuando estes codificando y asi corregir los errores en la marcha.

1. Files -> Settings
2. Languages and Frameworks
3. Javascript
4. Code & Quality Tools
5. JSHint
6. Checa el cuadro de Enable en la parte superior izquierda
7. Se habilitara la opcion de custom configuration file
8. Busca el archivo en el directorio root del proyecto llamado .jshintrc

Done!

### Reglas de commit
Considero utilizar las reglas que utilizamos anteriormente para los commits, son las siguientes:

1. (-) --> Modificaciones
2. (+) --> Agregar archivos
3. (!) --> Importante

Los commits los hare en INGLES.

Esto lo podemos acordar entre los dos, ya que estemos desarrollando pero por el momento utilizare las reglas escritas arriba.

### Setup DB
Lo primero es crear la base de datos en phpmyadmin

Despues en el archivo .env que esta en la carpeta raiz del proyecto cambiamos los valores que estan por los siguientes:

DB_DATABASE=bajaCorazonDB
DB_USERNAME=root
DB_PASSWORD=root

Es importante poner tu username y password de phpmyadmin

Ejecutar los siguientes comandos

1. sudo composer install
2. php artisan migrate
3. vendor/bin/phpunit

Este ultimo comando ejecuta el faker para llenar con info dummy las tablas

### Bienvenida

Bienvenido Luis, esperemos sacar el proyecto al cien y que sea el primero de muchos :)

Happy coding