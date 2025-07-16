package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func obligatorio2() {
	scanner := bufio.NewScanner(os.Stdin)
	fmt.Print("ingrese una oracion: ")
	scanner.Scan()
	oracion := scanner.Text()
	palabras := strings.Fields(oracion)

	for i := 0; i < len(palabras); i++ {
		if i%2 == 0 {
			runa := []rune(palabras[i]) // Convertir la palabra a un slice de runas
			for k := len(runa) - 1; k >= 0; k-- {
				fmt.Print(string(runa[k])) // Convertir el rune a string antes de imprimir
			}
		} else {
			fmt.Print(palabras[i]) // Imprimir la palabra actual

		}
		fmt.Print(" ") // Imprimir un espacio entre palabras
	}
}
