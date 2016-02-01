package ar.edu.clientesTarjetaCredito

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ClientePosta implements Cliente {
	int saldo
	int puntosAcumulados
	List<CondicionComercial> condicionesComerciales

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
		condicionesComerciales = new ArrayList<CondicionComercial>
		saldo = 0
	}

	def agregarCondicionComercial(CondicionComercial condicionComercial) {
		condicionesComerciales.add(condicionComercial)
	}

	def void agregarSafeShop(int montoMaximoSafeShop) {
		this.agregarCondicionComercial(new SafeShop(montoMaximoSafeShop))
	}
	
	def void agregarPromocion() {
		condicionesComerciales.add(new Promocion)
	}

	/**
	 * METODOS DE NEGOCIO
	 */
	override comprar(int monto) {
		condicionesComerciales.forEach [ condicion | condicion.comprar(monto, this) ]
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

	def void agregarPuntos(int unosPuntos) {
		puntosAcumulados = puntosAcumulados + unosPuntos
	}
	
}
