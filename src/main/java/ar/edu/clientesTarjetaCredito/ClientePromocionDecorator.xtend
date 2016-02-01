package ar.edu.clientesTarjetaCredito

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ClientePromocionDecorator extends ClienteDecorator {
	static int MONTO_MINIMO = 50
	static int PUNTOS_PROMOCION = 15

	int puntosAcumulados

	new(Cliente decorado) {
		super(decorado)
		puntosAcumulados = 0
	}
	
	override comprar(int monto) {
		decorado.comprar(monto)
		if (monto > MONTO_MINIMO) {
			puntosAcumulados = puntosAcumulados + PUNTOS_PROMOCION
		}
	}
	
	override def getPuntos() {
		puntosAcumulados
	}
	
}