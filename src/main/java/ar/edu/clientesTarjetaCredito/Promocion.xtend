package ar.edu.clientesTarjetaCredito

import ar.edu.clientesTarjetaCredito.CondicionComercial

class Promocion implements CondicionComercial {
	static int MONTO_MINIMO = 50
	static int PUNTOS_PROMOCION = 15

	override comprar(int monto, ClientePosta cliente) {
		if (monto > MONTO_MINIMO) {
			cliente.agregarPuntos(PUNTOS_PROMOCION)
		}
	}

}
