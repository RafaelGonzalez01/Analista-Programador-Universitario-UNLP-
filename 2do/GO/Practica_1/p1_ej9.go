package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"unicode"
)

func ej9() {

	scanner := bufio.NewScanner(os.Stdin)
	fmt.Println("ingrese una oracion: ")
	scanner.Scan()
	oracion := scanner.Text()
	palabras := strings.Fields(oracion)

	for _, palabra := range palabras {
		if strings.EqualFold(palabra, "jueves") {
			runa := []rune(palabra)
			martes := []rune("martes")
			for i := 0; i < len(runa); i++ {
				if unicode.IsUpper(runa[i]) {
					fmt.Print(string(unicode.ToUpper(martes[i])))
				} else {
					fmt.Print(string(martes[i]))
				}
			}
			fmt.Print(" ")
		} else if strings.EqualFold(palabra, "miercoles") {
			runa := []rune(palabra)
			automovil := []rune("automovil")
			for i := 0; i < len(runa); i++ {
				if unicode.IsUpper(runa[i]) {
					fmt.Print(string(unicode.ToUpper(automovil[i])))
				} else {
					fmt.Print(string(automovil[i]))
				}
			}
			fmt.Print(" ")
		} else {
			fmt.Print(palabra)
			fmt.Print(" ")
		}
	}
}
