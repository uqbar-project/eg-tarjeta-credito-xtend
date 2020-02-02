package ar.edu.tarjetaCredito

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

interface Cliente {
	def void comprar(int monto)
	def void pagarVencimiento(int monto)
	def boolean esMoroso()
	def int getSaldo()
	def int getPuntos()
}

@Accessors
class ClientePosta implements Cliente {
	int saldo = 0
	int puntosAcumulados
	List<CondicionComercial> condicionesComerciales = newArrayList

	new(int unSaldo) {
		saldo = unSaldo	
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
