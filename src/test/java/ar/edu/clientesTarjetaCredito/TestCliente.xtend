package ar.edu.clientesTarjetaCredito

import org.junit.Before
import org.junit.Assert
import org.junit.Test
import ar.edu.clientesTarjetaCredito.exceptions.BusinessException

class TestCliente {
	ClientePosta franco
	Cliente francoConNovia
	ClientePromocionDecorator francoEnPromo
	Cliente francoConNoviaEnPromo

	@Before
	def void init() {
		franco = new ClientePosta
		franco.saldo = 150
		francoConNovia = new ClienteSafeShopDecorator(franco, 55)
		francoEnPromo = new ClientePromocionDecorator(franco)
		francoConNoviaEnPromo = new ClientePromocionDecorator(francoConNovia)
	}

	@Test
	def void francoComprandoSinControl() {
		franco.comprar(60)
		Assert.assertEquals(210, franco.saldo)
	}

	@Test(expected=typeof(BusinessException))
	def void francoNoPuedeComprarConSafeShop() {
		francoConNovia.comprar(60)
	}

	@Test
	def void francoAcumulaPremios() {
		francoEnPromo.comprar(70)
		Assert.assertEquals(15, francoEnPromo.puntosAcumulados)
	}

	@Test(expected=typeof(BusinessException))
	def void francoConSafeShopNoAcumulaPremios() {
		francoConNoviaEnPromo.comprar(70)
	}

//	@Test
//	def void francoConSafeShopCompraElMinimoYAcumulaPremios() {
//		francoConNoviaEnPromo.comprar(52)
//		Assert.assertEquals(15, francoConNoviaEnPromo.puntosAcumulados)
//	}

}
