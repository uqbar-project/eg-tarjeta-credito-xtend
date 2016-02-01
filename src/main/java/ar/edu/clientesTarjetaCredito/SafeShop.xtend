package ar.edu.clientesTarjetaCredito

import ar.edu.clientesTarjetaCredito.exceptions.BusinessException

class SafeShop implements CondicionComercial {

	int montoMaximo

	new(int unMontoMaximo) {
		montoMaximo = unMontoMaximo
	}

	override comprar(int monto, ClientePosta cliente) {
		if (monto > montoMaximo) {
			throw new BusinessException("El monto " + monto + " supera " + montoMaximo + " que es el monto máximo")
		}
	}

}
