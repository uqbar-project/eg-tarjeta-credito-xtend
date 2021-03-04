
# Ejercicio de Diseño - Clientes de una Tarjeta de Crédito

[![Build Status](https://travis-ci.com/uqbar-project/eg-tarjeta-credito-xtend.svg?branch=decorator-strategies)](https://travis-ci.com/uqbar-project/eg-tarjeta-credito-xtend) [![Coverage Status](https://coveralls.io/repos/github/uqbar-project/eg-tarjeta-credito-xtend/badge.svg?branch=decorator-strategies&service=github)](https://coveralls.io/github/uqbar-project/eg-tarjeta-credito-xtend?branch=decorator-strategies&service=github)

<img src="images/creditCard.png" height="198" width="240"/>

## Dominio
Tenemos que modelar que ante cada compra de un cliente de una tarjeta de crédito

* ciertas compras mayores a un monto x se bloqueen
* los que compren más de n $ deben sumar puntos de promoción

Estas son condiciones comerciales que actúan sobre la compra.

## Explicación
La explicación del ejercicio se puede leer en [este apunte](https://docs.google.com/document/d/1CRKpt1pFyu6HOjRZF6EHkT8X96cRWclq9syxbJVeIVM/edit?usp=sharing)

## Branches

* [if](https://github.com/uqbar-project/eg-tarjeta-credito-xtend/tree/if): agrega las condiciones comerciales con ifs
* [strategy](https://github.com/uqbar-project/eg-tarjeta-credito-xtend/tree/strategy): las condiciones comerciales se implementan como strategies
* [decorator](https://github.com/uqbar-project/eg-tarjeta-credito-xtend/tree/decorator): las condiciones comerciales se implementan como decoradores del comportamiento del cliente
 * [decorator-cucumber](https://github.com/uqbar-project/eg-tarjeta-credito-xtend/tree/decorator-cucumber): el test se hace mediante una definición de [BDD (Behavior Driven Development)](https://en.wikipedia.org/wiki/Behavior-driven_development) implementada en [Cucumber](https://cucumber.io/)

