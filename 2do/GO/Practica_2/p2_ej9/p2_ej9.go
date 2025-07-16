package p2_ej9

import (
	"fmt"
)

type Nodo struct {
	Dato interface{}
	Sig  *Nodo
}

type List struct {
	Campo *Nodo
}

func New() *List {
	return &List{nil}
}
func IsEmpty(self *List) bool {
	return (self == nil)
}
func Len(self *List) int {
	cont := 0
	for n := self.Campo; n != nil; n = n.Sig {
		cont++
	}
	return cont
}
func FrontElement(self *List) interface{} {
	if self.Campo != nil {
		return self.Campo.Dato
	}
	panic("Lista Vacia")
}
func Next(self *List) *List {
	if self.Campo != nil {
		return &List{self.Campo.Sig}
	}
	return New()
}
func ToString(self *List) string {
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
func PushFront(self *List, elem interface{}) {
	nue := &Nodo{elem, self.Campo}
	self.Campo = nue
}
func PushBack(self *List, elem interface{}) {
	nue := &Nodo{elem, nil}
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
func Remove(self *List) interface{} {
	if self.Campo == nil {
		panic("lista vacia")
	}
	act := self.Campo.Dato
	self.Campo = self.Campo.Sig
	return act
}
func Iterate(self *List, f func(interface{}) interface{}) {
	for i := self.Campo; i != nil; i = i.Sig {
		i.Dato = f(i.Dato)
	}
}
