package ar.edu.tarjetaCreditoDecorator

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertFalse

@DisplayName("Dado un cliente sin condiciones comerciales")
class TestCliente {
	
	Cliente cliente

	@BeforeEach
	def void init() {
		cliente = new ClientePosta(50)
	}
	
	@Test
	@DisplayName("al pagar total del saldo en el vencimiento deja de ser moroso")
	def void testPagar() {
		cliente.pagarVencimiento(50)
		assertFalse(cliente.esMoroso, "El cliente pagó el vencimiento y sigue siendo moroso")
	}

	@Test
	@DisplayName("al comprar baja el saldo")
	def void testComprar() {
		cliente.comprar(50)
		assertEquals(cliente.saldo, 100)
	}

}
