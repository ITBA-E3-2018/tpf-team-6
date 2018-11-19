<div align = "center">
  <img src = "https://www.itba.edu.ar/intranet/comunicacion/wp-content/uploads/sites/7/2016/12/ITBA_Logo-01.png">
  </br></br>
</div>
<h1>
    <div align="center">
      <b>TP FINAL</b></br>
        </br>
      <b>ELECTRONICA III</b>
        </br>
    </div>
  </br>
   <div align="center">
      <b>CRONÓMETRO EN FPGA + VGA</b>
    </div>
  
</h1>
<h2>¿De qué se trata?</h2>
El tp final de Electronica III se basa en desarrollar un cronómetro utilizando un lenguaje de descripción de hardware, 
<a href ="https://en.wikipedia.org/wiki/Hardware_description_language">HDL</a> por sus siglas en ingles. En nuestro caso empleamos 
<a href ="https://es.wikipedia.org/wiki/Verilog"> Verilog</a>.
<br> 
El cronómetro opera sobre una <a href ="https://www.intel.com/content/www/us/en/products/programmable/fpga/cyclone-iv.html">FPGA Cyclone IV</a>.
Con el fin de poder visualizar el mismo en acción se empleo un monitor con conexión VGA.
Para poder mostrar los digitos en pantalla se realizo una interfaz opera mediante el protocolo VGA y una serie de modulos especialmente 
diseñados para mostrar dibujar los digitos sobre la pantalla.
Aquí debajo podran encontrar el esquema del programa.
<br>
Recuerden que aquí se esta empleando un lenguaje funcional y su naturaleza implica que la ejecución de sus diferente modulos 
se realizan en simultaneo.
<div align = "center">
  <h2>Esquema de funcionamiento</h2>
  </br>
  <img src = "https://github.com/ITBA-E3-2018/tpf-team-6/blob/master/ESQUEMA%20DE%20FUNCIONAMIENTO/Drawing1.png?raw=true">
</div>
<h2>¿Comó se hace?</h2>
Para llevarlo a cabo es sumamente necesario poder identificar las partes que componen al diseño.
<h3>Clock</h3>
Volcar nuestro codigo escrito en <a href ="https://es.wikipedia.org/wiki/Verilog"> Verilog</a> sobre un dispositivo fisíco implica que no podemos valernos de las facilidades que nos brinda el lenguaje para especificar <i>timesteps</i> dado que estos existen para poder realizar simulaciones y validaciones de diseño. Es por esto que debemos recurrir al <b>clock</b> interno de la FPGA. No poder traducir los retrasos (denotados con #) en <a href ="https://es.wikipedia.org/wiki/Verilog"> Verilog</a> nos fuerza a realizar modulos que dependan unicamente de contadores.
Dada las caracteristicas de la resolución de trabajo <b>640x480 a 60Hz</b>, escogimos utilizar un clock que opere a <b>25 MHz</b>. Para obtener esta frecuencia se hace uso de los divisores de clock que provee nativamente el entorno de <a href ="https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/overview.html">Quartus</a>. Este entorno provisto por Intel nos permite cargar nuestro diseño a la FPGA.

<h3>Contadores</h3>
Nuestro objetivo es poder contar el tiempo haciendo uso de un unico clock maestro. Para poder contar tanto en segundos como minutos y horas debemos poder contar cuantos pulsos de clock son equivalentes a dichas unidades de tiempo. De esta manera estamos diviendo el clock provisto por la FPGA en subclocks que atienden a nuestras necesidades. 

<h3>Separador de digitos</h3>
Si bien ya podemos contar el tiempo nos hace falta un elemento fundamental para poder ver el cronómetro en acción, los digitos. Sería muy ineficiente en terminos de memoria alojar cada posibilidad tiempo que pudiese ocurrir. Por lo tanto debemos saber qué digitos representan el tiempo.
Cada contador tiene como salida su correspondiente medida de tiempo representada como un entero (un arreglo de bits siendo más tecnico). Un modulo decodificador se encarga de separarlo en <b>decenas</b> y <b>unidades</b> para luego ser procesados y comenzar su viaje hacia el monitor.

Trabajo en progreso


