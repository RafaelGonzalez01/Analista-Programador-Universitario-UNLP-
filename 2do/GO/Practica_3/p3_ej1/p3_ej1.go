package main

import "fmt"

type Map[K comparable, V any] map[K]V

func main() {
	edades := Map[string, int]{
		"Juan":  25,
		"Ana":   30,
		"Pedro": 22,
	}

	fmt.Println("edades", edades)

	fmt.Println(edades["Juan"])
}
