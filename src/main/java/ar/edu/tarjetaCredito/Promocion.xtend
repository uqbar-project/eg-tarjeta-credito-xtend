package ar.edu.tarjetaCredito


class Promocion implements CondicionComercial {
	static int MONTO_MINIMO = 50
	static int PUNTOS_PROMOCION = 15
	
	override comprar(int monto, Cliente cliente) {
		println("comprar Promocion - sumo puntos")
		if (monto > MONTO_MINIMO) {
			cliente.agregarPuntos(PUNTOS_PROMOCION)
		}
	}
	
}
