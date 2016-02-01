package ar.edu.clientesTarjetaCredito

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class ClienteDecorator implements Cliente {
	
	Cliente decorado
	
	new(Cliente cliente) {
		decorado = cliente
	}
	
	override pagarVencimiento(int monto) {
		decorado.pagarVencimiento(monto)
	}
	
	override getPuntos() {
		decorado.puntos
	} 
	
	override getSaldo() {
		decorado.saldo
	}
	
	override esMoroso() {
		saldo > 0
	} 
	
}