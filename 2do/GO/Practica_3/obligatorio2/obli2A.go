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

func main() {
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
