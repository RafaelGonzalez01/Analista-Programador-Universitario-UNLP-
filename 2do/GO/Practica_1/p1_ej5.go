package main

import "fmt"

func ej5() {
	var x int64
	fmt.Println("ingrese un numero: ")
	fmt.Scanln(&x)
	switch {
	case x < -18:
		fmt.Println("El valor absoluto es: ", x*-1)
	case x <= -1:
		fmt.Println("el mod de x 4 es: ", x%4)
	case x >= 1 && x < 20:
		fmt.Println("El cuadrado del numero es: ", x*x)
	case x >= 20:
		fmt.Println("el numero en negativo es: ", x*-1)
	}
}
