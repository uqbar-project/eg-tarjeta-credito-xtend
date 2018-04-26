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
	
	def Cliente build() {
		var Cliente cliente = new ClientePosta(saldo)
		if (!deboDecorarCliente) {
			return cliente
		}
		
		var clienteDecorado = new ClienteCondicionComercial(cliente)
		if (tieneSafeShop) {
			clienteDecorado.agregarCondicionComercial(new SafeShop(montoMaximoSafeShop))
		}
		if (promocion) {
			clienteDecorado.agregarCondicionComercial(new Promocion)
		}
		clienteDecorado
	}
	
	def deboDecorarCliente() {
		tieneSafeShop || promocion
	}
	
	def boolean tieneSafeShop() {
		montoMaximoSafeShop > 0
	}
	
}