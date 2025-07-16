package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

func productor(num chan int, wg *sync.WaitGroup) {
	defer wg.Done()
	rand.Seed(time.Now().UnixNano())
	var val int
	var tiempo int
	for i := 0; i < 3; i++ {
		val = rand.Intn(101) // número aleatorio entre 0 y 100
		num <- val
		tiempo = rand.Intn(2)
		time.Sleep(time.Duration(tiempo) * time.Second)
	}
}

func consumidor(num chan int, id int, wg *sync.WaitGroup) {
	defer wg.Done()
	var val int
	for i := 0; i < 3; i++ {
		val = <-num
		fmt.Println("cunsumidor: ", id, " imprime: ", val)
	}
}

func main() {
	valores := make(chan int, 3)
	var wgProd sync.WaitGroup
	var wgCons sync.WaitGroup

	prod := 2
	cons := 2

	wgProd.Add(prod)

	go productor(valores, &wgProd)
	go productor(valores, &wgProd)

	go func() {
		wgProd.Wait()
		close(valores)
	}()

	wgCons.Add(cons)

	go consumidor(valores, 1, &wgCons)
	go consumidor(valores, 2, &wgCons)

	wgCons.Wait() //espera a que las 4 goroutines terminen
}
