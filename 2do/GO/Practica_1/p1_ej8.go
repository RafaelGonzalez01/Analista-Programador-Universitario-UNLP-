package main

import "fmt"

func ej8() {
	var x rune
	fmt.Println("ingrese el punto cardenal de donde viene el viento: ")
	fmt.Scanln(&x)
	switch x {
	case 'N':
		fmt.Println("el viento se dirigue al sur")
	case 'S':
		fmt.Println("el viento se dirigue al norte")
	case 'E':
		fmt.Println("el viento se dirigue al oeste")
	case 'O':
		fmt.Println("el viento se dirigue al este")
	default:
		fmt.Println("el punto cardinal ingresado no es valido")
	}
}
