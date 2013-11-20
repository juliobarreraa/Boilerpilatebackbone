Boilerpilatebackbone
====================

Boilerpilate-backbone

Boiler pilate es una colección de librerías independientes que ayudan a documentar y conformar una estructura de código mucho
más homogenea, estructurada.

* Compilando recursos JS

```
cd js/src/
r.js -o tools/build.js
```

* Compilando recursos CSS

```
cd css/src/
lessc -O1 --yui-compress main.less > ../style.css
```

* Soporte Bootstrap
```
git checkout less/css
```

* Soporte Bootstrap/Font-awesome
```
git checkout less/font-awesome
```
* Código de ejemplo
```
git checkout example
```

* Añadiendo nuevos archivos al compilador