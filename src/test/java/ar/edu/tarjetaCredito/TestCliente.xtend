package ar.edu.tarjetaCredito

import ar.edu.tarjetaCredito.exceptions.BusinessException
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestCliente {
	
	Cliente cliente
	Cliente gastatutti
	Cliente promosao
	Cliente mixto

	@Before
	def void init() {
		cliente = new ClienteBuilder()
			.saldo(50)
			.build
		 
		gastatutti = new ClienteBuilder()
			.saldo(50)
			.safeShop(30)
			.build

		promosao = new ClienteBuilder()
			.saldo(50)
			.promocion
			.build
			
		mixto = new ClientePosta(50) => [
			agregarSafeShop(80)
			agregarPromocion
		]
	}
	
	@Test
	def void testPagar() {
		cliente.pagarVencimiento(50)
		Assert.assertFalse("El cliente es moroso", cliente.esMoroso)
	}

	@Test
	def void testComprar() {
		cliente.comprar(50)
		Assert.assertEquals(cliente.saldo, 100)
	}

	@Test(expected = typeof(BusinessException))
	def void testComprarSafeShopNoDebo() {
		gastatutti.comprar(31)
	}

	@Test
	def void testComprarSafeShopFallidoNoAumentaSaldo() {
		try {
			gastatutti.comprar(31)
			Assert.fail("El cliente gastatutti no debería comprar por 31")			
		} catch (BusinessException e) {
			Assert.assertEquals(50, gastatutti.saldo)
		}
	}

	@Test
	def void testComprarSafeShopPuedo() {
		gastatutti.comprar(30)
	}
	
	@Test
	def void testComprarPromocionSinAcumular() {
		promosao.comprar(30)
		Assert.assertEquals(0, promosao.puntos)
	}

	@Test
	def void testComprarPromocionAcumulandoPuntos() {
		promosao.comprar(60)
		Assert.assertEquals(15, promosao.puntos)
	}
	
	@Test
	def void testComprarAcumulandoPuntosParaMixto() {
		mixto.comprar(60)
		Assert.assertEquals(110, mixto.saldo)
		Assert.assertEquals(15, mixto.puntos)
	}
	
	@Test(expected = typeof(BusinessException))
	def void testComprarSobrepasandoMaximoSafeShopParaMixto() {
		mixto.comprar(110)
	}

}