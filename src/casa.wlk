import cosas.* //obviamente, vamos a usar los objetos del archivo cosas ;-)
import cuentasBancarias.*

object casaDePepeYJulian {
	const cosas = []
	
	method comprar(cosa){
		cosas.add(cosa)
		self.gastar(cosa.precio())
	}
	
	method gastar(importe){
		cuentaCombinada.extraerImporte(importe)
	}
	
	method dineroDisponible() = cuentaCombinada.saldo()
	
	method saldo() = cuentaCombinada.saldo()
	
	method cantidadDeCosasCompradas() = cosas.size()
	
	method tieneComida() = cosas.any( { cosa => cosa.esComida() } )
	
	method vieneDeEquiparse() = cosas.last().esElectrodomestico() or (cosas.last().precio() > 50000)
	
	method esDerrochona() = cosas.sum{algo => algo.precio() } > 90000
	
	method compraMasCara()= cosas.max({ algo => algo.precio() })

	method electrodomesticosComprados() = cosas.filter{ algo => algo.esElectrodomestico()}
	
	method malaEpoca() = cosas.all( {algo => algo.esComida()} )
	
	method queFaltaComprar(lista){
		cosas.forEach( { algo => lista.remove(algo) } )
		return lista
	}
	
	method faltaComida()= cosas.filter({ algo => algo.esComida()}).size() < 2
	
}
