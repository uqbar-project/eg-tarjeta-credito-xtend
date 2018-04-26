package ar.edu.tarjetaCredito

import ar.edu.tarjetaCredito.exceptions.BusinessException

class SafeShop implements CondicionComercial {

	int montoMaximo

	new(int unMontoMaximo) {
		montoMaximo = unMontoMaximo
	}

	override comprar(int monto, Cliente cliente) {
		println("comprar Safe Shop - verifico monto")
		if (monto > montoMaximo) {
			throw new BusinessException("El monto " + monto + " supera " + montoMaximo + " que es el monto máximo")
		}
	}

}
