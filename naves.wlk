class Nave{
  var velocidad = 0
  var direccion = 0

  method velocicidad() = velocidad
  method direccion() = direccion

  method acelerar(cuanto){
    velocidad = ((velocidad + cuanto).min(100000))
  }
  method desacelerar(cuanto){
    velocidad = (velocidad - cuanto).max(0)
  }
  method irHaciaElSol(){
    direccion = 10
  }
  method escaparDelSol() {
    direccion = -10
  }
  method ponerseParaleloAlSol() {
    direccion = 0
  }
  method acercarseUnPocoAlSol() {
    direccion = (direccion + 1).min(10)
  }
  method alejarseUnPocoAlSola() {
    direccion = (direccion - 1).max(-10)
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
    self.ponerseParaleloAlSol()
  }
}

class NaveDePasajeros inherits Nave{
  const pasajeros = 0
  var cantComida = 0
  var cantBebida = 0

  method descargarComida(cant)  {
    cantComida -= cant
  }
  method cargarComida(cant) {
    cantComida += cant
  }
  method descargarBebida(cant)  {
    cantBebida -= cant
  }
  method cargarBebida(cant) {
    cantBebida += cant
  }

  override method prepararViaje(){    //sobrescribe el método de la clase padre
    self.cargarComida(pasajeros*4)
    self.cargarBebida(pasajeros*6)
    self.acercarseUnPocoAlSol()
  }
}

class NaveDeCombate inherits Nave{
  var estaInvisible = true
  var misilesDesplegados = false
  const property mensajesEnviados = []

  method estaInvisible() = estaInvisible
  method ponerseVisible() {
    estaInvisible = false
  }
  method ponerseInvisible() {
    estaInvisible = true
  }
  method misilesDesplegados() = misilesDesplegados
  method desplegarMisiles() {
    misilesDesplegados = true
  }
  method replegarMisiles() {
    misilesDesplegados = false
  }
  method emitirMensaje(mensaje) {
    mensajesEnviados.add(mensaje)
  }
  method primerMensajeEmitido() {
    mensajesEnviados.first()
  }
  method ultimosMensajeEmitido() {
    mensajesEnviados.last()
  }
  method emitioMensaje(mensaje) {
    return mensajesEnviados.contains(mensaje)
  }
  method esEscueto() {
    return mensajesEnviados.isEmpty()
  }

  override method prepararViaje(){    //sobrescribe el método de la clase padre
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitioMensaje("Saliendo en misión")
  }
}