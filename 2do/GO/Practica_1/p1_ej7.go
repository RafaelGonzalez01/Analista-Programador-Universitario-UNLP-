package main

import "fmt"

func ej7() {
	var temp float64
	var baja, alta, normal int
	var max, min float64 = 0, 1000
	for i := 0; i < 9; i++ {
		fmt.Println("ingrese una temperatura: ")
		_, err := fmt.Scan(&temp)
		if err != nil {
			fmt.Println("Error al asignar la temperatura, ingrese un numero")
			i--
			continue
		}
		if temp > min {
			min = temp
		}
		if temp < max {
			max = temp
		}
		switch {
		case temp < 36:
			baja++
		case temp < 37.5:
			normal++
		case temp > 37.5:
			alta++
		}
	}
	fmt.Println("Promedio de la emperatura baja: ", baja*100/10)
	fmt.Println("Promedio de la temperatura normal: ", normal*100/10)
	fmt.Println("Promedio de la temperatura alta: ", alta*100/10)

	fmt.Println("El promedio entero entre la temperatura maxima y la minima es: ", int(max/min))

}
