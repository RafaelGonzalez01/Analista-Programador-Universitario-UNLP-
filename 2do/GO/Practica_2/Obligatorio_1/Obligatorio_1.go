package main

import (
	"fmt"
	"math/rand"
	"practicas/p2_ej9"
	"time"
)

type codigo int

const (
	APU codigo = iota
	LI
	LS
)

type fecha struct {
	dia int
	mes int
	ano int
}

type estudiante struct {
	apellido          string
	nombre            string
	ciudad_origen     string
	nacimiento        fecha
	titulo_secundario bool
	cod               codigo
}

func (c codigo) String() string {
	switch c {
	case 0:
		return "APU"
	case 1:
		return "LI"
	case 2:
		return "LS"
	default:
		return "codigo incorrecto"
	}
}

func llenar_lista(lista *p2_ej9.List) {
	ciudades := []string{"Bariloche", "La Plata", "Buenos Aires", "Chascomus"}
	nombres := []string{"Juan", "Ana", "Luis", "Maria", "Pedro", "Lucia", "Carlos", "Sofia"}
	apellidos := []string{"Perez", "Gomez", "Lopez", "Diaz", "Fernandez", "Garcia", "Martinez", "Sanchez"}

	rand.Seed(time.Now().UnixNano())

	for i := 0; i < 50; i++ {
		est := estudiante{
			apellido:      apellidos[rand.Intn(len(apellidos))],
			nombre:        nombres[rand.Intn(len(nombres))],
			ciudad_origen: ciudades[rand.Intn(len(ciudades))],
			nacimiento: fecha{
				dia: rand.Intn(28) + 1,
				mes: rand.Intn(12) + 1,
				ano: rand.Intn(2004-1990+1) + 1990,
			},
			titulo_secundario: rand.Intn(2) == 0,
			cod:               codigo(rand.Intn(3)), // APU, LI, LS
		}
		p2_ej9.PushBack(lista, est)
	}
}


func obligatorio_1_ABCD(lista *p2_ej9.List) {
	//utilizar un map con los años para ir sumando
	anos := make(map[int]int)
	carrera := make(map[codigo]int)
	var prev *p2_ej9.Nodo
	for nact := lista.Campo; nact != nil; nact = nact.Sig {
		estudiante, ok := nact.Dato.(estudiante)
		if ok {
			if estudiante.ciudad_origen == "Bariloche" {
				fmt.Println(estudiante.nombre, " ", estudiante.apellido)
			}
			anos[estudiante.nacimiento.ano]++
			carrera[estudiante.cod]++
			if !estudiante.titulo_secundario {
				if prev == nil {
					// Es el primer nodo
					lista.Campo = nact.Sig
					nact = lista.Campo
					continue
				} else {
					prev.Sig = nact.Sig
					nact = prev.Sig
					continue
				}
			}
		}
		prev = nact
	}

	maxano := 0
	maxcant := 0

	for ano, cant := range anos {
		if cant > maxcant {
			maxano = ano
			maxcant = cant
		}
	}

	fmt.Println("El año con mas estudiantes es el: ", maxano, " con un total de ", maxcant, " alumnos.")

	var codmax codigo
	maxcant = 0

	for cod, cant := range carrera {
		if cant > maxcant {
			codmax = cod
			maxcant = cant
		}
	}

	fmt.Println("la carrera con mayot cantidad de inscriptos es: ", codmax)
}

func main() {
	var lista_alumnos *p2_ej9.List
	llenar_lista(lista_alumnos)
	obligatorio_1_ABCD(lista_alumnos)
}
