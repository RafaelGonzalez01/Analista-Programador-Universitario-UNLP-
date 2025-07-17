package main

import (
	"fmt"
	"os"
	"sort"
	"strconv"
	"sync"
)
	
func esPrimo(n int) bool {
	if n < 2 {
		return false
	}
	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func buscarPrimos(inicio, fin int, ch chan<- []int, wg *sync.WaitGroup) {
	defer wg.Done()
	var primos []int
	for i := inicio; i <= fin; i++ {
		if esPrimo(i) {
			primos = append(primos, i)
		}
	}
	ch <- primos
}

func main() {
	//verifica el primer parametro ingresado por consola
	N, err := strconv.Atoi(os.Args[1])
	if err != nil || N < 1 {
		fmt.Println("Ingrese un número entero positivo.")
		return
	}

	const numGoroutines = 2
	rango := (N - 1) / numGoroutines
	ch := make(chan []int, numGoroutines)
	var wg sync.WaitGroup

	inicio := 2
	for g := 0; g < numGoroutines; g++ {
		fin := inicio + rango
		if g == numGoroutines-1 {
			fin = N
		}
		wg.Add(1)
		go buscarPrimos(inicio, fin, ch, &wg)
		inicio = fin + 1
	}

	wg.Wait()
	close(ch)

	var Primos []int
	for primo := range ch {
		Primos = append(Primos, primo...)
	}

	sort.Ints(Primos)

	for _, p := range Primos {
		fmt.Print(p, " ")
	}

}
