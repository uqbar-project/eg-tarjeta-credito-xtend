package ar.edu.tarjetaCredito

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ClientePosta implements Cliente {
	int saldo = 0
	int puntosAcumulados
	List<CondicionComercial> condicionesComerciales = newArrayList

	new(int unSaldo) {
		saldo = unSaldo	
	}
	
	new(int unSaldo, int unMontoMaximoSafeShop) {
		saldo = unSaldo
		agregarSafeShop(unMontoMaximoSafeShop)
	}

	new(int unSaldo, boolean adhierePromocion) {
		saldo = unSaldo
		if (adhierePromocion) {
			agregarPromocion
		}
	}

	def agregarCondicionComercial(CondicionComercial condicionComercial) {
		condicionesComerciales.add(condicionComercial)
	}

	def void agregarSafeShop(int montoMaximoSafeShop) {
		this.agregarCondicionComercial(new SafeShop(montoMaximoSafeShop))
	}
	
	def void agregarPromocion() {
		this.agregarCondicionComercial(new Promocion)
	}

	/**
	 * METODOS DE NEGOCIO
	 */
	override comprar(int monto) {
		condicionesComerciales.forEach [ 
			condicion | condicion.comprar(monto, this)
		]
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
