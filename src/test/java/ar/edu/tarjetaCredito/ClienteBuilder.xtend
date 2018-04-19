package ar.edu.tarjetaCredito

class ClienteBuilder {
	
	int saldo
	int montoMaximoSafeShop
	boolean promocion = false
	
	new() {
	}
	
	def saldo(int _saldo) {
		this.saldo = _saldo
		this
	}
	
	def safeShop(int montoMaximo) {
		montoMaximoSafeShop = montoMaximo
		this
	}
	
	def promocion() {
		promocion = true
		this
	}
	
	def build() {
		new ClientePosta(saldo) => [
			if (montoMaximoSafeShop > 0) {
				it.agregarSafeShop(montoMaximoSafeShop)
			}
			if (promocion) {
				it.agregarPromocion
			}
		]
	}
	
}