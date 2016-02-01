package ar.edu.tarjetaCreditoConIfs

import ar.edu.tarjetaCreditoConIfs.exceptions.BusinessException

class ClientePosta implements Cliente {
	static int MONTO_MINIMO = 50
	static int PUNTOS_PROMOCION = 15

	int saldo
	boolean adheridoPromocion
	boolean adheridoSafeShop
	int puntosAcumulados
	int montoMaximoSafeShop

	new(int unSaldo) {
		initialize
		saldo = unSaldo	
	}
	
	new(int unSaldo, int unMontoMaximoSafeShop) {
		initialize
		saldo = unSaldo
		agregarSafeShop(unMontoMaximoSafeShop)
	}

	new(int unSaldo, boolean adhierePromocion) {
		initialize
		saldo = unSaldo
		if (adhierePromocion) {
			agregarPromocion
		}
	}

	def void initialize() {
		saldo = 0
		montoMaximoSafeShop = 0
		adheridoSafeShop = false
		adheridoPromocion = false
	}

	def void agregarSafeShop(int montoMaximoSafeShop) {
		this.adheridoSafeShop = true
		this.montoMaximoSafeShop = montoMaximoSafeShop
	}

	def void agregarPromocion() {
		this.adheridoPromocion = true
	}

	/**
	 * METODOS DE NEGOCIO
	 */
	override comprar(int monto) {
		if (adheridoSafeShop && monto > montoMaximoSafeShop) {
			throw new BusinessException("El monto excede el máximo permitido")
		}
		saldo = saldo + monto
		if (adheridoPromocion && monto > MONTO_MINIMO) {
			puntosAcumulados = puntosAcumulados + PUNTOS_PROMOCION
		}
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
	
	override getSaldo() {
		saldo
	}

}
