package main

import (
	"errors"
	"fmt"
)

//implementar libreria de error

type Dato struct {
	valor       int
	ocurrencias int
}

type OptimumSlice []Dato

func New(s []int) OptimumSlice {
	if len(s) == 0 {
		return OptimumSlice{}
	}
	var aux OptimumSlice
	actual := s[0]
	ocurrencias := 1
	for i := 1; i < len(s); i++ {
		if s[i] == actual {
			ocurrencias++
		} else {
			aux = append(aux, Dato{actual, ocurrencias})
			actual = s[i]
			ocurrencias = 1
		}
	}
	return aux
}

func Len(o OptimumSlice) int {
	total := 0
	for _, i := range o {
		total += i.ocurrencias
	}
	return total
}

func IsEmpty(o OptimumSlice) bool {
	return len(o) == 0
}

func FrontElement(o OptimumSlice) (int, error) {
	if len(o) == 0 {
		return -1, errors.New("Slice vacio")
	} else {
		return o[0].valor, nil
	}
}

func LastElement(o OptimumSlice) (int, error) {
	long := len(o)
	if long == 0 {
		return -1, errors.New("Slice vacio")
	}
	return o[long-1].valor, nil
}

func Insert(o OptimumSlice, element int, position int, cant int) (OptimumSlice, error) {
	if position < 0 || position > Len(o) {
		return OptimumSlice{}, fmt.Errorf("posición inválida: %d", position)
	}
	var nueva []Dato
	actual := 0
	insertado := false

	for _, e := range o {
		if actual+e.ocurrencias < position {
			nueva = append(nueva, e)
			actual += e.ocurrencias
		} else if !insertado && actual <= position && position < actual+e.ocurrencias {
			antes := position - actual
			despues := e.ocurrencias - antes

			if antes > 0 {
				nueva = append(nueva, Dato{valor: e.valor, ocurrencias: antes})
			}
			nueva = append(nueva, Dato{valor: element, ocurrencias: cant})

			if despues > 0 {
				nueva = append(nueva, Dato{valor: e.valor, ocurrencias: despues})
			}
			insertado = true
			actual += e.ocurrencias
		} else {
			nueva = append(nueva, e)
		}
	}
	if position == Len(o) {
		nueva = append(nueva, Dato{valor: element, ocurrencias: cant})
	}
	return OptimumSlice(nueva), nil
}

func SliceArray(o OptimumSlice) []int {
	var s []int
	for _, e := range o {
		for i := 0; i < e.ocurrencias; i++ {
			s = append(s, e.valor)
		}
	}
	return s
}

func imprimirSlice(o OptimumSlice) {
	for _, e := range o {
		fmt.Printf("%d[%d] ", e.valor, e.ocurrencias)
	}
}

func main() {
	// Prueba de New
	fmt.Println("== Prueba de New ==")
	original := []int{1, 1, 2, 2, 2, 3, 3, 4}
	opt := New(original)
	fmt.Print("Compresión: ")
	imprimirSlice(opt)
	fmt.Println()

	// Prueba de Len
	fmt.Println("Longitud:", Len(opt))

	// Prueba de IsEmpty
	fmt.Println("¿Está vacío?:", IsEmpty(opt))

	// Prueba de FrontElement
	front, err := FrontElement(opt)
	if err != nil {
		fmt.Println("FrontElement error:", err)
	} else {
		fmt.Println("Primer elemento:", front)
	}

	// Prueba de LastElement
	last, err := LastElement(opt)
	if err != nil {
		fmt.Println("LastElement error:", err)
	} else {
		fmt.Println("Último elemento:", last)
	}

	// Prueba de Insert
	fmt.Println("\n== Inserción de 9[2] en posición 4 ==")
	opt, err = Insert(opt, 9, 4, 2)
	if err != nil {
		fmt.Println("Error al insertar:", err)
	} else {
		fmt.Print("Después de insertar: ")
		imprimirSlice(opt)
		fmt.Println()
	}

	// Prueba de Insert al final
	fmt.Println("\n== Inserción de 5[3] al final ==")
	opt, err = Insert(opt, 5, Len(opt), 3)
	if err != nil {
		fmt.Println("Error al insertar:", err)
	} else {
		fmt.Print("Después de insertar al final: ")
		imprimirSlice(opt)
		fmt.Println()
	}

	// Prueba de SliceArray
	fmt.Println("\n== Conversión a slice plano ==")
	flat := SliceArray(opt)
	fmt.Println("Slice plano:", flat)

	// Prueba con slice vacío
	fmt.Println("\n== Prueba con slice vacío ==")
	vacio := New([]int{})
	fmt.Println("¿Está vacío?:", IsEmpty(vacio))
	_, err = FrontElement(vacio)
	if err != nil {
		fmt.Println("FrontElement con vacío:", err)
	}
	_, err = LastElement(vacio)
	if err != nil {
		fmt.Println("LastElement con vacío:", err)
	}
}