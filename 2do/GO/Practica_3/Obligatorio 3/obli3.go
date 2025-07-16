package main

import (
	"fmt"
	"math/rand"
	"os"
	"sync"
	"time"
)

const (
	cantGoroutines = 4
	cantTareas     = 20
	valor          = 5
)

type Tarea struct {
	prioridad int
	valor     int
}

func generarTareas() []Tarea {
	tareas := make([]Tarea, cantTareas)
	for i := 0; i < cantTareas; i++ {
		tareas[i] = Tarea{
			prioridad: rand.Intn(4),   // Prioridad entre 0 y 3
			valor:     rand.Intn(100), // Valor entre 0 y 99
		}
	}
	return tareas
}

func scheduler(tareas []Tarea, chanTareas chan Tarea) {
	for prioridad := 0; prioridad <= 3; prioridad++ {
		for _, tarea := range tareas {
			if tarea.prioridad == prioridad {
				chanTareas <- tarea
			}
		}
	}
	close(chanTareas)
}

func Worker(id int, tareas <-chan Tarea, wg *sync.WaitGroup, mutex0, mutex1, mutex3 *sync.Mutex, acumulador *int) {
	defer wg.Done()
	for tarea := range tareas {
		switch tarea.prioridad {
		case 0:
			resultado := sumarDigitos(tarea.valor)
			fmt.Println("Worker con id: ", id, ", Prioridad 0, suma de digitos: ", tarea.valor, ": ", resultado)
			texto := fmt.Sprintf("(0, %d)\n", resultado)
			mutex0.Lock()
			agregarTexto("prioridad0.txt", texto)
			mutex0.Unlock()
		case 1:
			resultado := invertirDigitos(tarea.valor)
			fmt.Println("Worker con id: ", id, ", Prioridad 1, invertirDigitos: ", tarea.valor, ": ", resultado)
			texto := fmt.Sprintf("(0, %d)\n", resultado)
			mutex1.Lock()
			agregarTexto("prioridad1.txt", texto)
			mutex1.Unlock()
		case 2:
			resultado := multiplicarValor(tarea.valor)
			fmt.Println("Worker con id: ", id, ", Prioridad 2, multiplicar valores: ", tarea.valor, ": ", resultado)
		case 3:
			mutex3.Lock()
			*acumulador = +tarea.valor
			fmt.Println("Worker con id: ", id, ", Prioridad 3, valores acumulados: ", *acumulador)
			mutex3.Unlock()
		}
	}
}

func sumarDigitos(num int) int {
	var resultado = 0
	for num > 0 {
		resultado += num % 10
		num /= 10
	}
	return resultado
}

func invertirDigitos(num int) int {
	var resultado = 0
	for num > 0 {
		resultado = resultado*10 + num%10
		num /= 10
	}
	return resultado
}

func multiplicarValor(num int) int {
	var resultado = num * valor
	return resultado
}

func agregarTexto(nombre string, texto string) {
	f, err := os.OpenFile(nombre, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		fmt.Println("no se pudo abrir el archivo:", err)
		return
	}
	defer f.Close()
	f.WriteString(texto)
}

func main() {
	rand.Seed(time.Now().UnixNano())

	tareas := generarTareas()

	for _, tarea := range tareas {
		fmt.Printf("Prioridad: %d, Valor: %d\n", tarea.prioridad, tarea.valor)
	}

	chanTareas := make(chan Tarea, cantTareas)
	var wg sync.WaitGroup
	var mutex0, mutex1, mutex3 sync.Mutex
	acumulador := 0

	for i := 0; i < cantGoroutines; i++ {
		wg.Add(1)
		go Worker(i, chanTareas, &wg, &mutex0, &mutex1, &mutex3, &acumulador)
	}

	go scheduler(tareas, chanTareas)

	wg.Wait()
}
