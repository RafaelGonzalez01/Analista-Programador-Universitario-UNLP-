package main

import "fmt"

func main() {
	var i int
	fmt.Println("ingrese el numero del ejercicio a ejecutar: ")
	fmt.Scanln(&i)
	switch {
	case i == 2:
		ej2()
	case i == 3:
		ej3()
	case i == 4:
		ej4()
	case i == 5:
		ej5()
	case i == 6:
		ej6_1()
		ej6_2()
		ej6_3()
	case i == 7:
		ej7()
	case i == 8:
		ej8()
	case i == 9:
		ej9()
	case i == 10:
		ej9()
	case i == 11:
		obligatorio2()
	case i == 12:
		obligatorio3()
	}
}
