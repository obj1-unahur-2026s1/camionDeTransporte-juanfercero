object camion {
    const carga = []
    var peso = 1000

    method bajarCarga(cosa) {
      carga.remove(cosa)
    }

    method subirCarga(cosa) {
      carga.add(cosa)
    }
}
