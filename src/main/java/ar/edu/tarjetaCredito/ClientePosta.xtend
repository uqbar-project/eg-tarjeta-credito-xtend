package ar.edu.tarjetaCredito

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ClientePosta implements Cliente {
	int saldo = 0
	int puntosAcumulados

	new(int unSaldo) {
		saldo = unSaldo	
	}
	
	/**
	 * METODOS DE NEGOCIO
	 */
	override comprar(int monto) {
		println("Comprar posta - saldo actualizado")
		saldo = saldo + monto
	}

	override pagarVencimiento(int monto) {
		saldo = saldo - monto
	}

	override esMoroso() {
		saldo > 0
	}

	override getPuntos() {
		puntosAcumulados
	}

	override agregarPuntos(int unosPuntos) {
		puntosAcumulados = puntosAcumulados + unosPuntos
	}
	
}
