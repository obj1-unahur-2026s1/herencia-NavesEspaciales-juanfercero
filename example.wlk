class Nave{
  var velocidad = 0
  var direccion = 0

  method velocicidad() = velocidad
  method direccion() = direccion

  method acelerar(cuanto){
    velocidad = ((velocidad + cuanto).min(100000)).max(0)
  }

  method prepararViaje()  //lo convierte en clase abstracta
} //el metodo abstracto permite que todas las naves tengan un método prepararViaje, pero cada una lo implementa a su manera o no hace nada por default
  //además impide crear objetos directamente de la clase Nave, ya que no se puede implementar el método prepararViaje

class NaveBaliza inherits Nave{
  var colorBaliza = "verde"


  method cambiarColorBaliza(nuevoColor){
    colorBaliza = nuevoColor
  }

  override method prepararViaje(){    //sobrescribe el método de la clase padre
    
    self.cambiarColorBaliza("verde")
  }
}