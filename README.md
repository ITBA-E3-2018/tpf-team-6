<div align = "center">
  <img src = "https://github.com/ITBA-E3-2018/tp3-team-6/blob/master/Informe/logo.jpg?raw=true" width="265" height="106">
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
<a  href ="https://en.wikipedia.org/wiki/Hardware_description_language">HDL</a> por sus siglas en ingles. En nuestro caso empleamos 
<a  href ="https://es.wikipedia.org/wiki/Verilog"> Verilog</a>.
<br> 
El cronómetro opera sobre una <a  href ="https://www.intel.com/content/www/us/en/products/programmable/fpga/cyclone-iv.html">FPGA Cyclone IV</a>.
Con el fin de poder visualizar el mismo en acción se empleo un monitor con conexión <a  href = "https://es.wikipedia.org/wiki/Video_Graphics_Array">VGA</a>.
Para poder mostrar los digitos en pantalla se realizo una interfaz opera mediante el protocolo <a href = "https://es.wikipedia.org/wiki/Video_Graphics_Array">VGA</a> y una serie de modulos especialmente 
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
Volcar nuestro codigo escrito en <a target="_blank" href ="https://es.wikipedia.org/wiki/Verilog"> Verilog</a> sobre un dispositivo fisíco implica que no podemos valernos de las facilidades que nos brinda el lenguaje para especificar <i>timesteps</i> dado que estos existen para poder realizar simulaciones y validaciones de diseño. Es por esto que debemos recurrir al <b>clock</b> interno de la FPGA. No poder traducir los retrasos (denotados con #) en <a target="_blank" href ="https://es.wikipedia.org/wiki/Verilog"> Verilog</a> nos fuerza a realizar modulos que dependan unicamente de contadores.
Dada las caracteristicas de la resolución de trabajo <b>640x480 a 60Hz</b>, escogimos utilizar un clock que opere a <b>25.175 MHz</b>.
La elección de esta frecuencia viene condicionada por la resolución. Si desean obtener la respectiva frecuencia de clock para otra resolución pueden dirijirse a <a href="http://www.epanorama.net/faq/vga2rgb/calc.html">epanorama.net</a> para obtener el calculo de manera automatica. 
Para obtener esta frecuencia se hace uso de los divisores de clock que provee nativamente el entorno de <a target="_blank" href ="https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/overview.html">Quartus</a>. Este entorno provisto por Intel nos permite cargar nuestro diseño a la FPGA.

<h3>Contadores</h3>
Nuestro objetivo es poder contar el tiempo haciendo uso de un unico clock maestro. Para poder contar tanto en segundos como minutos y horas debemos poder contar cuantos pulsos de clock son equivalentes a dichas unidades de tiempo. De esta manera estamos diviendo el clock provisto por la FPGA en subclocks que atienden a nuestras necesidades. 

<h3>Separador de digitos</h3>
Si bien ya podemos contar el tiempo nos hace falta un elemento fundamental para poder ver el cronómetro en acción, los digitos. Sería muy ineficiente en terminos de memoria alojar cada posibilidad tiempo que pudiese ocurrir. Por lo tanto debemos saber qué digitos representan el tiempo.
Cada contador tiene como salida su correspondiente medida de tiempo representada como un entero (un arreglo de bits siendo más tecnico). Un modulo decodificador se encarga de separarlo en <b>decenas</b> y <b>unidades</b> para luego ser procesados y comenzar su viaje hacia el monitor.
<div align = "center">
  <img src = "https://github.com/ITBA-E3-2018/tpf-team-6/blob/master/ESQUEMA%20DE%20FUNCIONAMIENTO/NumSep.PNG?raw=true">
</div>
<br>
<h3>Modulo VGA</h3>
  Para poder comunicarle al monitor cual sera la resolución de trabajo debemos respetar un cierto protocolo que involucra dos señales de sincronismo.
  <br>
  <div align = "center">
  <a href = "https://timetoexplore.net/s/vga640x480.jpg">
    <img src = "https://timetoexplore.net/s/vga640x480.jpg" height = 300>
  <a>
  </div>
Aquí debajo se pueden apreciar ambas señales al mismo tiempo. Notese que la zona verde indica la zona visible.
<div align = "center">
  <img src = "http://blogs.fsfe.org/pboddie/files/2017/05/vga_timing1.png"  height = 300>
</div>
<h3>¡Hora de graficar!</h3>
  Dadas las señales de sincronización, el monitor comenzara su barrido a través de la pantalla. Para esto, el modulo <b>VGA</b> nos provee de la coordenadas actuales sobre las que esta el cursor del monitor. Es decir, al avanzar dos señales indicaran en que posición relativa al extremo superior izquierdo esta actualmente el cursor.
  <br>
Una vez obtenido dicho dato, se debe poder discernir qué graficar (qué número) y dondé.
  <h4>Seleccionando el número</h4>
    Para poder seleccionar el número adecuado a graficar debemos poder leer la data enviada por el modulo <b>separador de digito<b>. Este actualizara su información una vez por barrido completo de la pantalla. De esta forma evitamos imprevistos durante el proceso de dibujo. Por ejemplo, el digito de los segundo podría cambiar durante el barrido causando que la imagen no se vea correctamente.

<h4> Graficando</h4>
Para poder graficar se diseño a cada número como un conjunto de cuadrados que ilustran el digito.
<div align = "center">
<img src = "https://github.com/ITBA-E3-2018/tpf-team-6/blob/master/ESQUEMA%20DE%20FUNCIONAMIENTO/digitos.jpeg?raw=true">
<div>
Ahora, con el fin de poder mostrar el número en pantalla se diseñaron modulos que permiten graficar los digitos individualmente. Cada uno de esos modulos tiene toda la información necesaria como para poder saber su ubicación relativa en la pantalla.
<div align = "center">
  <img src ="https://github.com/ITBA-E3-2018/tpf-team-6/blob/master/ESQUEMA%20DE%20FUNCIONAMIENTO/SingleNumber.PNG?raw=true">
</div>
  
  

