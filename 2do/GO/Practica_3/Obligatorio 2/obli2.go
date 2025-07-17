package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

const (
	numClientes = 10
	numCajas    = 3
)

type Cliente struct {
	id int
}

var r = rand.New(rand.NewSource(time.Now().UnixNano()))

func atenderCaja(id int, cola chan Cliente, wg *sync.WaitGroup) {
	defer wg.Done()
	for cliente := range cola {
		fmt.Printf("Caja %d atendiendo al cliente %d\n", id, cliente.id)
		time.Sleep(time.Duration(r.Intn(1000)+1) * time.Millisecond) // Simula el tiempo de atención
		fmt.Printf("Caja %d ha terminado de atender al cliente %d\n", id, cliente.id)
	}
}

func a() {
	var wg sync.WaitGroup
	cola := make(chan Cliente, numClientes) // canal de tipo clientes con capacidad "numClientes"

	for i := 0; i < numClientes; i++ {
		cliente := Cliente{id: i}
		cola <- cliente
	}
	close(cola) //cerrar el canal (dejamos de cargar clientes)

	inicio := time.Now()
	for i := 1; i < numCajas; i++ {
		wg.Add(1)
		go atenderCaja(i, cola, &wg)
	}
	wg.Wait()
	fmt.Printf("Tiempo total de atencion: %v\n", time.Since(inicio))
}

func b() {

	var wg sync.WaitGroup
	cajas := make([]chan Cliente, numCajas)

	// Crear colas individuales por caja
	for i := 0; i < numCajas; i++ {
		cajas[i] = make(chan Cliente)
	}

	// Lanzar goroutines para las cajas
	for i := 0; i < numCajas; i++ {
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
	for i := 0; i < numCajas; i++ {
		cliente := Cliente{id: i + 1}
		cajaDestino := i % numCajas //
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

func AsignarCajaMasCorta(contadores []int) int {
	min := contadores[0]
	indice := 0
	for i := 1; i < len(contadores); i++ {
		if contadores[i] < min {
			min = contadores[i]
			indice = i
		}
	}
	return indice
}

func c() {

	var wg sync.WaitGroup
	cajas := make([]chan Cliente, numClientes)
	contadores := make([]int, numCajas)

	// Crear colas con búfer
	for i := 0; i < numCajas; i++ {
		cajas[i] = make(chan Cliente, numClientes) // Capacidad total para evitar bloqueo
	}

	// Lanzar goroutines para cada caja
	for i := 0; i < numCajas; i++ {
		wg.Add(1)
		go atenderCaja(i, cajas[i], &wg)
	}

	inicio := time.Now()

	// Asignar clientes a la caja con la cola más corta
	for i := 0; i < numClientes; i++ {
		cliente := Cliente{id: i + 1}
		idx := AsignarCajaMasCorta(contadores)
		cajas[idx] <- cliente
		contadores[idx]++
	}

	// Cerrar todas las colas
	for _, cola := range cajas {
		close(cola)
	}

	wg.Wait()
	fmt.Printf("Tiempo total de atencion: %v\n", time.Since(inicio))
}

func main() {
	a()
	b()
}
