package main

import (
	"bufio"
	"errors"
	"fmt"
	"os"
)

type PuntoCardinal int

const (
	N PuntoCardinal = iota //esto es dato de punto cardinal como enumerativo?
	S
	E
	O
	NE
	SE
	NO
	SO
)

func ej3() {
	scanner := bufio.NewScanner(os.Stdin)
	var punto PuntoCardinal
	var err error = errors.New("mensaje de error")

	for err != nil {
		fmt.Println("ingrese un punto cardinal: ")
		scanner.Scan()
		entrada := scanner.Text()
		switch entrada {
		case "N":
			punto, err = N, nil
		case "S":
			punto, err = S, nil
		case "E":
			punto, err = E, nil
		case "O":
			punto, err = O, nil
		case "NE":
			punto, err = NE, nil
		case "SE":
			punto, err = SE, nil
		case "NO":
			punto, err = NO, nil
		case "SO":
			punto, err = SO, nil
		default:
			err = errors.New("no corresponde a un punto cardinal")
		}
	}

	fmt.Println("usando switch: ")
	a(punto)

	fmt.Println("usando orden de definicion: ")
	b(punto)

	fmt.Println("usando maps: ")
	c(punto)

}

func a(punto PuntoCardinal) {
	switch punto {
	case 0:
		fmt.Println("el viento se dirige a ", (punto + 1))
	case 1:
		fmt.Println("el viento se dirige a ", (punto - 1))
	case 2:
		fmt.Println("el viento se dirige a ", (punto + 1))
	case 3:
		fmt.Println("el viento se dirige a ", (punto - 1))
	case 4:
		fmt.Println("el viento se dirige a ", (punto + 1))
	case 5:
		fmt.Println("el viento se dirige a ", (punto - 1))
	case 6:
		fmt.Println("el viento se dirige a ", (punto + 1))
	case 7:
		fmt.Println("el viento se dirige a ", (punto - 1))
	}
}

func b(punto PuntoCardinal) {
	if int(punto)%2 == 0 {
		fmt.Println("el viento se dirige a ", (punto + 1))
	} else {
		fmt.Println("el viento se dirige a ", (punto - 1))
	}
}

func c(punto PuntoCardinal) {
	opuestos := map[PuntoCardinal]PuntoCardinal{
		N:  S,
		S:  N,
		E:  O,
		O:  E,
		NE: SO,
		SO: NE,
		SE: NO,
		NO: SE,
	}
	fmt.Println("el viento se dirige a " + fmt.Sprint(opuestos[punto]))
}

func (p PuntoCardinal) String() string {
	switch p {
	case N:
		return "N"
	case S:
		return "S"
	case E:
		return "E"
	case O:
		return "O"
	case NE:
		return "NE"
	case SE:
		return "SE"
	case NO:
		return "NO"
	case SO:
		return "SO"
	default:
		return "Desconocido"
	}
}

func main() {
	ej3()
}
