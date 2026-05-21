object camion {
    const carga = []
    const tara = 1000
    const cosasPeligrosas = []
    const altaPeligrosidad = 50
    const pesoMaximoPermitido = 2500

    method bajarCarga(cosa) {
      carga.remove(cosa)
      if (cosa.peligrosidad() >= altaPeligrosidad) {
        cosasPeligrosas.remove(cosa)
      }
    }
    method subirCarga(cosa) {
      if (cosa.peligrosidad() >= altaPeligrosidad) {
        cosasPeligrosas.add(cosa)
      }
      carga.add(cosa)
    }
    method peso() = tara + carga.sum({c => c.peso()})
    method elPesoDeTodasLasCosasEsPar() = carga.all({c => c.peso() % 2 == 0})
    method algunaCosaPesa(peso) = carga.any({c => c.peso() == peso})
    method primeraCosaPeligrosa() = cosasPeligrosas.first()
    method cosasPeligrosas() = cosasPeligrosas
    method estaExedidoDePeso() = self.peso() > pesoMaximoPermitido
    method puedeCircularEnRuta() = !self.estaExedidoDePeso() && self.cosasPeligrosas().size() == 0
}
