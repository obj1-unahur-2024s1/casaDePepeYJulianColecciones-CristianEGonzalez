import casa.*
import cosas.*

object cuentaCorriente{
	var saldo = 30000
	
	method depositarImporte(importe){
		saldo += importe
	}
	method extraerImporte(importe){
		saldo -= importe
	}
	method saldo() = saldo
}

object cuentaGastos{
	var saldo = 2000000
	
	method depositarImporte(importe){
		saldo += importe - 200
	}
	method extraerImporte(importe){
		saldo = saldo - if (importe <= 10000) (importe+200) else (importe + (importe*0.02))
	}
	method saldo() = saldo
}

object cuentaCombinada{
	
	method depositarImporte(importe){
		cuentaCorriente.depositarImporte(importe)
	}
	method extraerImporte(importe){
		if (cuentaCorriente.saldo() >= importe){
			cuentaCorriente.extraerImporte(importe)
		}else{
			var descuento = importe
			
			descuento -= cuentaCorriente.saldo()
			cuentaCorriente.extraerImporte(cuentaCorriente.saldo())
			cuentaGastos.extraerImporte(descuento)
		}
	}
	method saldo() = cuentaCorriente.saldo() + cuentaGastos.saldo()
}