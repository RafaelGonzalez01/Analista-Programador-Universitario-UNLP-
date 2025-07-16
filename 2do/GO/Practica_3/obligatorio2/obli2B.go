package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

// Estructura cliente
type Cliente struct {
	id int
}

const (
	cantClientes = 20
	cantCajas    = 3
)

var r = rand.New(rand.NewSource(time.Now().UnixNano()))

func main() {

	var wg sync.WaitGroup
	cajas := make([]chan Cliente, cantCajas)

	// Crear colas individuales por caja
	for i := 0; i < cantCajas; i++ {
		cajas[i] = make(chan Cliente)
	}

	// Lanzar goroutines para las cajas
	for i := 0; i < cantCajas; i++ {
		wg.Add(1)
		go func(id int, cola chan Cliente) {
			defer wg.Done()
			for cliente := range cola {
				fmt.Printf("Caja %d atendiendo al cliente %d\n", id+1, cliente.id)
				time.Sleep(time.Millisecond * time.Duration(rand.Intn(1000)))
			}
		}(i, cajas[i]) //
	}

	// Iniciar medición de tiempo
	inicio := time.Now()

	// Asignar clientes a las cajas usando round-robin
	for i := 0; i < cantClientes; i++ {
		cliente := Cliente{id: i + 1}
		cajaDestino := i % cantCajas //
		cajas[cajaDestino] <- cliente
	}

	// Cerrar todas las colas (cuando ya no hay más clientes)
	for _, cola := range cajas {
		close(cola)
	}

	// Esperar a que todas las cajas terminen
	wg.Wait()

	// Imprimir duración total
	fmt.Printf("\nTiempo total de atención (round-robin): %v\n", time.Since(inicio))
}
