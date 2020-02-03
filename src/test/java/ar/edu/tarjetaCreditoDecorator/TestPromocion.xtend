package ar.edu.tarjetaCreditoDecorator

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals

@DisplayName("Dado un cliente que tiene únicamente promoción como condición comercial")
class TestPromocion {
	
	Cliente promocion

	@BeforeEach
	def void init() {
		promocion = new ClientePromocionDecorator(new ClientePosta(40))
	}
	
	@Test
	@DisplayName("al comprar por debajo del límite necesario para acumular puntos, no acumula puntos de promoción")
	def void testComprarPromocionSinAcumular() {
		promocion.comprar(50)
		assertEquals(0, promocion.puntos)
	}

	@Test
	@DisplayName("al comprar por arriba del monto necesario para acumular puntos, acumula puntos de promoción")
	def void testComprarPromocionAcumulandoPuntos() {
		promocion.comprar(60)
		assertEquals(15, promocion.puntos)
	}
	
}
