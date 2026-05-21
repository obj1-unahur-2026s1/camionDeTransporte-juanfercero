object knightRider {
  method peso() = 500
  method peligrosidad() = 10
  method bulto() = 1
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
}

object residuosRadioactivos {
    var property peso = 500
    method peligrosidad() = 200
    method bulto() = 1
}

object embalajeDeSeguridad {
    var objeto = residuosRadioactivos
    method peso() = objeto.peso()
    method peligrosidad() = objeto.peligrosidad() / 2
    method cambiarObjeto(carga) {
        objeto = carga
    }
    method bulto() = 2
}

object arenaAGranel {
    var property peso = 100
    method peligrosidad() = 1
    method bulto() = 1
}