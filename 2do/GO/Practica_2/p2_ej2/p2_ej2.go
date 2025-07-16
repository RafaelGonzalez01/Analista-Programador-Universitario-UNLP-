package main

import (
	"bufio" //leer
	"errors"
	"fmt"     //imprimir
	"os"      //leer
	"strconv" //convertir tipos
)

func ej2() {
	//declaro la variables
	scanner := bufio.NewScanner(os.Stdin)          // scanner para leer
	var numero int                                 // numero para trabajar
	var err error = errors.New("mensaje de error") //variable error para comprobar que se ingrese el valor correcto

	//leo hasta que se ingrese un numero correcto
	for err != nil {
		fmt.Println("ingrese un numero para calcular su factorial: ")
		//permito la entrada por teclado
		scanner.Scan()
		entrada := scanner.Text()
		//verifico si se ingreso un string convertible a float64
		numero, err = strconv.Atoi(entrada)
	}
	fmt.Println("solucion iterativa: ")
	fmt.Println(interativa(numero))
	fmt.Println("solucion recursiva: ")
	fmt.Println(recursiva(numero))
}

func interativa(numero int) int {
	if numero < 0 {
		return 0
	}
	var resultado int = 1
	for i := numero; i > 1; i-- {
		resultado *= i
	}
	return resultado
}

func recursiva(numero int) int {
	if numero > 1 {
		return numero * recursiva(numero-1)
	} else {
		return 1
	}
}
