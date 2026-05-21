object knightRider {
  method peso() = 500
  method peligrosidad() = 10
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
  method transformarEnCamion() {
    esAuto = false
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
}

object residuosRadioactivos {
    var property peso = 500
    method peligrosidad() = 200
}

object embalajeDeSeguridad {
    var objeto = residuosRadioactivos
    method peso() = objeto.peso()
    method peligrosidad() = objeto.peligrosidad() / 2
    method cambiarObjeto(carga) {
        objeto = carga
    }
}