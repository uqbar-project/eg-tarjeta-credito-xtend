package ar.edu.clientesTarjetaCredito

import ar.edu.clientesTarjetaCredito.exceptions.BusinessException
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestCliente {
	
	ClientePosta cliente
	ClientePosta gastatutti
	ClientePosta promosao
	ClientePosta mixto

	@Before
	def void setUp() throws Exception {
		cliente = new ClientePosta(50)
		gastatutti = new ClientePosta(150, 30)
		promosao = new ClientePosta(40, true)
		mixto = new ClientePosta(50)
		mixto.agregarSafeShop(100)
		mixto.agregarPromocion
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