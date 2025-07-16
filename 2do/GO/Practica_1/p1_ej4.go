package main

import "fmt"

const Tope = 250

func ej4() {
	//imprime todos los numeros pares menores o iguales a 250
	for i := 0; i <= Tope; i += 2 {
		fmt.Println(i)
	}
	//imprime en sentido contrario
	for i := Tope; i >= 0; i -= 2 {
		fmt.Println(i)
	}
}
