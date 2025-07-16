package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func ej1() {
	//creo un scanner para leer la entrada estandar
	scanner := bufio.NewScanner(os.Stdin)

	//creo un arreglo(o slice?) de 10 elementos
	temperaturas := make([]float64, 10)

	//creo variables para contar las temperaturas
	var bajo, normal, alto int
	var contbajo, contnormal, contalto float64

	//leo las temperaturas
	for i := 0; i < 10; i++ {
		fmt.Println("ingrese una temperatura en grados Celsius:")
		//leo una temperatura
		scanner.Scan()
		act := scanner.Text()
		//convierto el string a float64
		var err error
		temperaturas[i], err = strconv.ParseFloat(act, 64)
		//compruebo si ingreso un numero
		if err != nil {
			fmt.Println("ingrese una temperatura valida")
			i--
		}

		if temperaturas[i] < 36 {
			bajo++
			contbajo += temperaturas[i]
		} else if temperaturas[i] < 37.5 {
			normal++
			contnormal += temperaturas[i]
		} else {
			alto++
			contalto += temperaturas[i]
		}
	}
}

func ej1_a_b_c() {
	//creo un scanner para leer la entrada estandar
	scanner := bufio.NewScanner(os.Stdin)

	//creo un map de 3 posiciones, clave string, valor arreglo de 2 float64
	temperaturas := map[string][2]float64{
		"bajo":        {0, 0},
		"normal":      {0, 0},
		"alto":        {0, 0},
		"incorrectos": {0, 0},
	}

	for i := 0; i < 10; i++ {
		fmt.Println("Ingrese una temperatura en grados Celsius:")
		// Leo una temperatura
		scanner.Scan()
		act := scanner.Text()
		// Convierto el string a float64
		temp, err := strconv.ParseFloat(act, 64)
		// Compruebo si ingresó un número válido
		if err != nil {
			fmt.Println("Ingrese una temperatura válida")
			i--
			continue
		}
		// convierto la temperatura a Fahrenheit
		fmt.Println("se ingreso la temperatura: ", temp, "Celsius", ", Fahrenheit: ", ej1_c(temp))
		// Clasifico la temperatura
		switch {
		case temp < 20 || temp > 50:
			// Si la temperatura es incorrecta, la guardo en el map
			aux := temperaturas["incorrectos"]
			aux[0] += temp
		case temp < 36:
			//no se puede modificar el valor de un map??
			//creo una variable auxiliar para almacenar el valor del map
			aux := temperaturas["bajo"]
			aux[0] += temp // suma de temperaturas
			aux[1]++       // cantidad de temperaturas
			//asigno el valor de la variable auxiliar al map
			temperaturas["bajo"] = aux
		case temp < 37.5:
			aux := temperaturas["normal"]
			aux[0] += temp
			aux[1]++
			temperaturas["normal"] = aux
		default:
			aux := temperaturas["alto"]
			aux[0] += temp
			aux[1]++
			temperaturas["alto"] = aux
		}
	}
	for clave, valor := range temperaturas {
		// %s para string, %.2f con dos decimales, %0.f sin decimales, %2f con dos decimalels
		fmt.Printf("Categoría: %s, Suma: %.2f, Cantidad: %.0f, Promedio: %.2f\n", clave, valor[0], valor[1], valor[0]/valor[1])
	}
}

func ej1_c(temp float64) float64 {
	//funcion que recibe una temperatura en grados Celsius y la convierte a Fahrenheit
	return (temp * 9 / 5) + 32
}

// no pude hacer go run p2-1.go < input2-1.txt
