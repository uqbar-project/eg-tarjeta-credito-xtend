package ar.edu.tarjetaCredito

import java.util.List

class ClienteCondicionComercial implements Cliente {
	
	protected Cliente cliente
	protected List<CondicionComercial> condicionesComerciales = newArrayList
	
	new(Cliente _cliente) {
		cliente = _cliente	
	}

	def void agregarCondicionComercial(CondicionComercial condicionComercial) {
		condicionesComerciales.add(condicionComercial)
	}
	
	override comprar(int monto) {
		condicionesComerciales.forEach [ 
			condicionComercial | condicionComercial.comprar(monto, this)
		]
		cliente.comprar(monto)
	}
	
	override pagarVencimiento(int monto) {
		cliente.pagarVencimiento(monto)
	}
	
	override esMoroso() { cliente.esMoroso }
	override getSaldo() { cliente.saldo }
	override getPuntos() { cliente.puntos }
	
	override agregarPuntos(int puntos) {
		cliente.agregarPuntos(puntos)
	}
	
}