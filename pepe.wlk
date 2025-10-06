//Empleados
object pepe {
  method neto(categoria) = categoria
  method sueldo(categoria, bonoResultados, bonoPresentismo, faltas) = categoria.neto() + bonoResultados.valor(categoria) + bonoPresentismo.valor(categoria, faltas)
}

object sofia {
  method sueldo(categoria, bonoResultados) = categoria.neto() + bonoResultados.valor(categoria)
  method neto(categoria) = categoria.neto() * 1.3
}

object roque {
  method neto() = 28000
  method sueldo(bonoResultados) = self.neto() + bonoResultados.valor(self) + 9000
}

object ernesto {
  method sueldo(compañero, bonoPresentismo) = compañero.neto() + bonoPresentismoAjuste.valor(self, 0)
}

//Categorías
object gerente {
  method neto() = 15000
}

object cadete {
  method neto() = 20000
}

object vendedor {
  method neto(aumento) {
    var sueldo = 16000
    if (aumento) sueldo = sueldo * 1.25
    return sueldo
  }

  method activarAumentoPorMuchasVentas() = true
  method desactivarAumentoPorMuchasVentas() = false
}

object medioTiempo {
  var base = cadete
  method categoriaBase(categoria) {
    base = categoria
  }
  method neto() = base.neto() / 2
}

//Bonos
object bonoResultadosPorcentaje {
  method valor(categoria) = categoria.neto() * 0.10
}

object bonoResultadosMontoFijo {
  method valor(categoria) = 800
}

object bonoResultadosNulo {
  method valor(categoria) = 0
}

object bonoPresentismoNormal {
  method valor(categoria, faltas) {
    var resultado = 0
    if (faltas == 0) resultado = 2000
    if (faltas == 1) resultado = 1000
    return resultado
  }
}

object bonoPresentismoAjuste {
  method valor(categoria, faltas) {
    var resultado = 0
    if (faltas == 0) resultado = 100
    return resultado
  }
}

object bonoPresentismoDemagogico {
  method valor(categoria, faltas) {
    var resultado = 300
    if (categoria.neto() < 18000) resultado = 500
    return resultado
  }
}

object bonoPresentismoNulo {
  method valor(categoria, faltas) = 0
}