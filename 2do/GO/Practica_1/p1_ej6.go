package main

import "fmt"

func ej6_1() {
	var y, x int
	fmt.Println("ingrese dos numeros enteros: ")
	fmt.Scanln(&x, &y)
	if y < x {
		fmt.Println(x / y)
	} else {
		fmt.Println(y / x)
	}
}

func ej6_2() {
	var y, x uint
	fmt.Println("ingrese dos numeros sin signo: ")
	fmt.Scanln(&x, &y)
	if y < x {
		fmt.Println(x / y)
	} else {
		fmt.Println(y / x)
	}
}

func ej6_3() {
	var y, x float64
	fmt.Println("ingrese dos numeros flotantes: ")
	fmt.Scanln(&x, &y)
	if y < x {
		fmt.Println(x / y)
	} else {
		fmt.Println(y / x)
	}
}
