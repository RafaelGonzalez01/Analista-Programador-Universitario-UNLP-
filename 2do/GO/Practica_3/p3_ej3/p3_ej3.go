package main

import (
	"fmt"
	"time"
)

func main() {
	done := make(chan bool)
	fmt.Println("Inicia Goroutine del main")
	go hello(done)
	time.Sleep(1 * time.Second) // le da tiempo a que inicie la gourutine
	<-done                      // espera a que la goroutine termine
	fmt.Println("Termina Goroutine del main")
}

func hello(done chan bool) {
	fmt.Println("Inicia Goroutine de hello")

	for i := 0; i < 3; i++ {
		fmt.Println(i, " Hello world")
	}

	fmt.Println("Termina Goroutine de hello")
	done <- true // Notifica que terminó
}
