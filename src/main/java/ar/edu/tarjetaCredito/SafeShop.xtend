package ar.edu.tarjetaCredito

import ar.edu.tarjetaCredito.exceptions.BusinessException

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
