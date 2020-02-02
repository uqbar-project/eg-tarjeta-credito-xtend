package ar.edu.tarjetaCredito

import ar.edu.tarjetaCredito.exceptions.BusinessException

interface CondicionComercial {
	def void comprar(int monto, ClientePosta cliente)
}

class Promocion implements CondicionComercial {
	static int MONTO_MINIMO = 50
	static int PUNTOS_PROMOCION = 15

	override comprar(int monto, ClientePosta cliente) {
		if (monto > MONTO_MINIMO) {
			cliente.agregarPuntos(PUNTOS_PROMOCION)
		}
	}
}

class SafeShop implements CondicionComercial {
	int montoMaximo

	new(int unMontoMaximo) {
		montoMaximo = unMontoMaximo
	}

	override comprar(int monto, ClientePosta cliente) {
		if (monto > montoMaximo) {
			throw new BusinessException("El monto a comprar debe ser inferior a $ " + monto)
		}
	}
}
