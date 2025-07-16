package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"unicode"
)

func obligatorio3() {
	sacnner := bufio.NewScanner(os.Stdin)

	fmt.Println("ingrese la palabra de argumento:")
	sacnner.Scan()
	argumento := sacnner.Text()
	
	fmt.Print("ingrese una oracion: ")
	sacnner.Scan()
	oracion := sacnner.Text()

	palabras := strings.FieldsFunc(oracion, func(r rune) bool {
		return r == ',' || r == '.' || r == ' ' || r == ';' || r == ':' || r == '?' || r == '!'
	}) //separo la oracion en palabras

	for _, palabra := range palabras {
		if strings.EqualFold(palabra, argumento) { //busco la palabra en la oracion
			ori := []rune(palabra)
			nue := []rune(argumento)
			for i := 0; i < len(ori); i++ {
				if unicode.IsLower(ori[i]) {
					fmt.Print(string(unicode.ToUpper(nue[i])))
				} else {
					fmt.Print(string(nue[i]))
				}
			}
		} else {
			fmt.Print(palabra)
		}
		fmt.Print(" ")
	}
}
