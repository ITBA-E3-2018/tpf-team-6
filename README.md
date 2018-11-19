<div align = "center">
  <img src = "https://www.itba.edu.ar/intranet/comunicacion/wp-content/uploads/sites/7/2016/12/ITBA_Logo-01.png">
  </br></br>
</div>
<h1>
    <div align="center">
      <b>TP FINAL</b>
    </div>
  </br>
   <div align="center">
      <b>CRONÓMETRO EN FPGA + VGA</b>
    </div>
  </br>
    <div align="center"><b>ELECTRONICA III</b></div>
  </br>
</h1>
<h2>¿De qué se trata?</h2>
El tp final de Electronica III se basa en desarrollar un cronómetro utilizando un lenguaje de descripción de hardware, 
<a href ="https://en.wikipedia.org/wiki/Hardware_description_language">HDL</a> por sus siglas en ingles. En nuestro caso empleamos 
<a href ="https://es.wikipedia.org/wiki/Verilog"> Verilog</a>.
<br> 
El mismo opera sobre una <a href ="https://www.intel.com/content/www/us/en/products/programmable/fpga/cyclone-iv.html">FPGA Cyclone IV</a>.
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
