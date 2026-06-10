class Nave{
  var velocidad = 0
  var direccion = 0
  var combustible = 0

  method velocicidad() = velocidad
  method direccion() = direccion
  method combustible() = combustible 

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

  method prepararViaje()  {
    self.cargarCombustible(30000)
    self.acelerar(5000)
  }
  //lo convierte en clase abstracta
  //el metodo abstracto permite que todas las naves tengan un método prepararViaje, pero cada una lo implementa a su manera o no hace nada por default
  //además impide crear objetos directamente de la clase Nave, ya que no se puede implementar el método prepararViaje
  //por la seccion de combustible y que todos comparten la misma carga parece que va a tener que dejar de ser abstracto

  //Combustible
  method cargarCombustible(cant) {
    combustible += cant
  }
  method descargarCombustible(cant) {
    combustible -= cant
  }

  //Tranquilidad
  method estaTranquila() {
    return combustible >= 4000 && velocidad < 12000 && self.condicionExtraDeTranquilidad()
  }

  method condicionExtraDeTranquilidad() //vuelve a ser una clase abstracta nice
}



class NaveBaliza inherits Nave{
  var colorBaliza = "verde"


  method cambiarColorBaliza(nuevoColor){
    colorBaliza = nuevoColor
  }

  override method prepararViaje(){    //sobrescribe el método de la clase padre
    super()
    self.cambiarColorBaliza("verde")
    self.ponerseParaleloAlSol()
  }

  //tranquilidad
  override method condicionExtraDeTranquilidad() {
    return colorBaliza != "rojo"
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
    super()
    self.cargarComida(pasajeros*4)
    self.cargarBebida(pasajeros*6)
    self.acercarseUnPocoAlSol()
  }

  //tranquilidad
  override method condicionExtraDeTranquilidad() {
  }
}

class NaveHospital inherits NaveDePasajeros{
  const tieneQuirofanosPreparados = true

  //tranquilidad
  override method condicionExtraDeTranquilidad() {
    return tieneQuirofanosPreparados
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
    super()
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitioMensaje("Saliendo en misión")
  }

  //tranquilidad
  override method condicionExtraDeTranquilidad() {
    return not self.misilesDesplegados()
  }
}

class NaveDeCombateSilenciosa inherits NaveDeCombate{
  //tranquilidad
  override method condicionExtraDeTranquilidad() {
    super()
    return not self.estaInvisible()
  }
}