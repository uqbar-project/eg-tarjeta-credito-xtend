package ar.edu.tarjetaCreditoDecorator

import ar.edu.tarjetaCreditoDecorator.exceptions.BusinessException
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestCliente {
	ClientePosta franco
	Cliente francoSeguro
	ClientePromocionDecorator francoEnPromo
	ClientePromocionDecorator francoSeguroYPromo

	@Before
	def void init() {
		franco = new ClientePosta => [
			saldo = 150
		]
		francoSeguro = new ClienteSafeShopDecorator(franco, 55)
		francoEnPromo = new ClientePromocionDecorator(franco)
		francoSeguroYPromo = new ClientePromocionDecorator(francoSeguro)
	}

	@Test
	def void francoComprandoSinControl() {
		franco.comprar(60)
		Assert.assertEquals(210, franco.saldo)
	}

	@Test(expected=typeof(BusinessException))
	def void francoNoPuedeComprarConSafeShop() {
		francoSeguro.comprar(60)
	}

	@Test
	def void francoAcumulaPremios() {
		francoEnPromo.comprar(70)
		Assert.assertEquals(15, francoEnPromo.puntosAcumulados)
	}

	@Test
	def void francoConSafeShopNoAcumulaPremios() {
		try {
			francoSeguroYPromo.comprar(70)
			Assert.fail("Franco con safe shop debería haber fallado al comprar por $ 70")
		} catch (BusinessException e) {
			Assert.assertEquals(0, francoSeguroYPromo.puntosAcumulados)
		}
	}

	@Test
	def void francoConSafeShopCompraElMinimoYAcumulaPremios() {
		francoSeguroYPromo.comprar(52)
		Assert.assertEquals(15, francoSeguroYPromo.puntosAcumulados)
	}

}
