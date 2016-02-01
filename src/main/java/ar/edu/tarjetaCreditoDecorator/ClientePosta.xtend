package ar.edu.tarjetaCreditoDecorator

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ClientePosta implements Cliente {
	
	int saldo
	
	new() {
		saldo = 0
	}
	
	new(int unSaldo) {
		saldo = unSaldo
	}
	
	override comprar(int monto) {
		saldo = saldo + monto
	}
	
	override pagarVencimiento(int monto) {
		saldo = saldo - monto
	}
	
	override esMoroso() {
		saldo > 0
	}
	
	override getPuntos() {
		0
	}
	
}