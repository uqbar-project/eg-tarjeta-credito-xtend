package ar.edu.tarjetaCredito

class ClienteBuilder {
	
	int saldo
	int montoMaximoSafeShop
	boolean promocion = false
	
	def saldo(int saldo) {
		this.saldo = saldo
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
				agregarSafeShop(montoMaximoSafeShop)
			}
			if (promocion) {
				agregarPromocion
			}
		]
	}
	
}