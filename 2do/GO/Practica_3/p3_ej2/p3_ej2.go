package main

import (
	"fmt"
)

type Nodo[T any] struct {
	Dato T
	Sig  *Nodo[T]
}

type List[T any] struct {
	Campo *Nodo[T]
}

func New[T any]() *List[T] {
	return &List[T]{nil}
}
func IsEmpty[T any](self *List[T]) bool {
	return self == nil //arreglar por nil y sacar tamaño
}
func Len[T any](self *List[T]) int {
	cont := 0
	for n := self.Campo; n != nil; n = n.Sig {
		cont++
	}
	return cont
}
func FrontElement[T any](self *List[T]) T {
	if self.Campo != nil {
		return self.Campo.Dato
	}
	panic("Lista Vacia")
}
func Next[T any](self *List[T]) *List[T] {
	if self.Campo != nil {
		return &List[T]{self.Campo.Sig}
	}
	panic("No hay siguiente")
}
func ToString[T any](self *List[T]) string {
	var resul string
	for i := self.Campo; i != nil; i = i.Sig {
		//usa %v para imprimir cualquier dato
		resul += fmt.Sprintf("%v", i.Dato)
		if i.Sig != nil {
			resul += " "
		}
	}
	return resul
}
func PushFront[T any](self *List[T], elem T) {
	nue := &Nodo[T]{elem, self.Campo}
	self.Campo = nue
}
func PushBack[T any](self *List[T], elem T) {
	nue := &Nodo[T]{elem, nil}
	if self.Campo == nil {
		self.Campo = nue
	} else {
		act := self.Campo
		for act.Sig != nil {
			act = act.Sig
		}
		act.Sig = nue
	}
}
func Remove[T any](self *List[T]) T {
	if self.Campo == nil {
		panic("lista vacia")
	}
	act := self.Campo.Dato
	self.Campo = self.Campo.Sig
	return act
}
func Iterate[T any](self *List[T], f func(T) T) {
	for i := self.Campo; i != nil; i = i.Sig {
		i.Dato = f(i.Dato)
	}
}
