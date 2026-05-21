object knightRider {
  method peso() = 500
  method peligrosidad() = 10
  method bulto() = 1
  method ejecusionPorCarga(){

  }
}

object bumblebee {
  var esAuto = true

  method peso() = 800
  method peligrosidad() {
    var p = 30
    if (esAuto) {
      p = 15
    }
    return p
  }
  method transformarEnAuto() {
    esAuto = true
  }
  method transformarEnRobot() {
    esAuto = false
  }
  method bulto() = 1
  method ejecusionPorCarga(){
    self.transformarEnRobot()
  }
}

object paqueteDeLadrillos {
  var cantLadrillos = 2
  const pesoLadrillo = 2
  method peso() = cantLadrillos * pesoLadrillo
  method peligrosidad() = 2
  method agregarLadrillos(cant) {
    cantLadrillos = cantLadrillos + cant
  }
  method bulto() {
    var salida = 0
    if (cantLadrillos <= 100) {
      salida = 1
    } else if (cantLadrillos <= 300) {
      salida = 2
    } else {
      salida = 3
    }
    return salida
  }
  method ejecusionPorCarga(){
    self.agregarLadrillos(12)
  }
}

object bateriaAntiaerea {
  var tieneMisiles = true 
  method peso() = if (tieneMisiles) 300 else 200
  method peligrosidad() = if (tieneMisiles) 100 else 0
  method equiparMisiles() {
    tieneMisiles = true
  }
  method desequiparMisiles() {
    tieneMisiles = false
  }
  method bulto() = if (tieneMisiles) 2 else 1
  method ejecusionPorCarga(){
        self.equiparMisiles()
    }
}

object contenedorPortuario {
  const carga = []
  const pesoBase = 100
  method peso() = pesoBase + carga.sum({c => c.peso()})
  method peligrosidad(){
    var salida = 0
    if (carga.size() > 0) {
      salida = carga.max({c => c.peligrosidad()})
    }
    return salida
  }
  method agregarCarga(cosa) {
    carga.add(cosa)
  }
  method eliminarCarga(cosa) {
    carga.remove(cosa)
  }
  method bulto() = 1 + carga.sum({c => c.bulto()})
  method ejecusionPorCarga(){
        carga.forEach({c => c.ejecusionPorCarga()})
    }
}

object residuosRadioactivos {
    var peso = 30
    method peligrosidad() = 200
    method quitarPeso(cant) {
        peso = peso - cant
    }
    method agregarPeso(cant) {
        peso = peso + cant
    }
    method bulto() = 1
    method ejecusionPorCarga(){
        self.agregarPeso(15)
    }
}

object embalajeDeSeguridad {
    var objeto = residuosRadioactivos
    method peso() = objeto.peso()
    method peligrosidad() = objeto.peligrosidad() / 2
    method cambiarObjeto(carga) {
        objeto = carga
    }
    method bulto() = 2
    method ejecusionPorCarga(){
    }
}

object arenaAGranel {
    var peso = 100
    method peligrosidad() = 1
    method bulto() = 1
    method quitarArena(cant) {
        peso = peso - cant
    }
    method agregarArena(cant) {
        peso = peso + cant
    }
    method ejecusionPorCarga(){
        self.quitarArena(10)
    }
}