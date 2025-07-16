package main

import (
	"crypto/sha256"
	"fmt"
)

type fecha struct {
	dia     int
	mes     int
	ano     int
	segundo int
	minuto  int
	hora    int
}

type transaccion struct {
	monto      float64
	id_envio   int
	id_recibo  int
	fecha_hora fecha
}

type bloque struct {
	hash        [32]byte
	hash_previo [32]byte
	data        transaccion
	fecha_hora  fecha
}

type billetera struct {
	id    int
	saldo float64
}

var blockchain []bloque

func crear_billetera(id int) billetera {
	return billetera{id: id, saldo: 0.0}
}

func Enviar_transaccion(envio, recibo *billetera, monto float64, fecha_hora fecha, hash_previo [32]byte) bloque {
	if envio.saldo < monto {
		panic("Saldo insuficiente")
	}
	envio.saldo -= monto
	recibo.saldo += monto

	trans := transaccion{
		monto:      monto,
		id_envio:   envio.id,
		id_recibo:  recibo.id,
		fecha_hora: fecha_hora,
	}

	datos := fmt.Sprintf("%d%d%d%f%d%d%d%d%d%x",
		trans.id_envio,
		trans.id_recibo,
		trans.fecha_hora.ano,
		trans.monto,
		trans.fecha_hora.mes,
		trans.fecha_hora.dia,
		trans.fecha_hora.hora,
		trans.fecha_hora.minuto,
		trans.fecha_hora.segundo,
		hash_previo,
	)
	hash := sha256.Sum256([]byte(datos))

	return bloque{
		hash:        hash,
		hash_previo: hash_previo,
		data:        trans,
		fecha_hora:  fecha_hora,
	}
}

func insertar_bloque(b bloque) {
	blockchain = append(blockchain, b)
}

func obtener_saldo(id_usuario int) float64 {
	var saldo float64 = 0

	for _, b := range blockchain {
		act := b.data
		if act.id_envio == id_usuario {
			saldo -= act.monto
		}
		if act.id_recibo == id_usuario {
			saldo += act.monto
		}
	}

	return saldo
}

func validar_cadena() bool {
	for i := 1; i < len(blockchain); i++ {
		bloque_actual := blockchain[i]
		bloque_anterior := blockchain[i-1]

		// Recalcular el hash del bloque anterior
		datos := fmt.Sprintf("%d%d%d%f%d%d%d%d%d%x",
			bloque_anterior.data.id_envio,
			bloque_anterior.data.id_recibo,
			bloque_anterior.data.fecha_hora.ano,
			bloque_anterior.data.monto,
			bloque_anterior.data.fecha_hora.mes,
			bloque_anterior.data.fecha_hora.dia,
			bloque_anterior.data.fecha_hora.hora,
			bloque_anterior.data.fecha_hora.minuto,
			bloque_anterior.data.fecha_hora.segundo,
			bloque_anterior.hash_previo,
		)
		hash_recalculado := sha256.Sum256([]byte(datos))

		// Verificar que el hash_previo del bloque actual coincide con el hash del bloque anterior
		if bloque_actual.hash_previo != hash_recalculado {
			return false
		}
	}
	return true
}

func main() {
	// Crear billeteras
	b1 := crear_billetera(1)
	b2 := crear_billetera(2)

	// Depositar saldo inicial en b1
	b1.saldo = 1000

	// Crear bloque génesis (primer bloque, sin hash previo)
	fecha1 := fecha{dia: 1, mes: 1, ano: 2024, hora: 10, minuto: 0, segundo: 0}
	genesis := Enviar_transaccion(&b1, &b2, 100, fecha1, [32]byte{})
	insertar_bloque(genesis)

	// Segunda transacción
	fecha2 := fecha{dia: 2, mes: 1, ano: 2024, hora: 12, minuto: 30, segundo: 0}
	bloque2 := Enviar_transaccion(&b2, &b1, 50, fecha2, genesis.hash)
	insertar_bloque(bloque2)

	// Tercera transacción
	fecha3 := fecha{dia: 3, mes: 1, ano: 2024, hora: 15, minuto: 45, segundo: 0}
	bloque3 := Enviar_transaccion(&b1, &b2, 200, fecha3, bloque2.hash)
	insertar_bloque(bloque3)

	// Mostrar saldos
	fmt.Println("Saldo billetera 1:", obtener_saldo(1))
	fmt.Println("Saldo billetera 2:", obtener_saldo(2))

	// Validar la cadena
	if validar_cadena() {
		fmt.Println("La blockchain es válida.")
	} else {
		fmt.Println("La blockchain NO es válida.")
	}
}
