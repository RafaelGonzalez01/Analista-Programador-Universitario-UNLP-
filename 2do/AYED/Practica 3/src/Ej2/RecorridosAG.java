package Ej2;

import java.util.*;
import Ej1.*;
import Ej1.Queue;

public class RecorridosAG {
	
	private GeneralTree<Integer> dato;
	
	public RecorridosAG(GeneralTree<Integer> dato) {
		this.dato = dato;
	}
	
	public void imprimirPreorden(){
		this.imprimirPreorden(this.dato);
	}
	
	private void imprimirPreorden(GeneralTree<Integer> nodo) {
	    if (nodo == null) {
	        return;
	    }

	    // Imprimir el valor del nodo actual
	    System.out.print(nodo.getData() + " ");

	    // Recorrer los hijos recursivamente
	    for (GeneralTree<Integer> hijo : nodo.getChildren()) {
	        imprimirPreorden(hijo);
	    }
	}
	
	public List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree <Integer> a,Integer n){
		LinkedList<Integer> aux = new LinkedList<Integer>();
		if ((a.getData()>n) && (a.getData()/2 != 0)) {
			aux.add(a.getData());
		} 
		if (!a.isLeaf()) {
			for (GeneralTree<Integer> elto:a.getChildren()) {
				aux.addAll(numerosImparesMayoresQuePreOrden(elto,n));
			}
		}
		return aux;
	}
	
	 public List<Integer> numerosImparesMayoresQueInOrden (GeneralTree <Integer> a,Integer n){
		 LinkedList<Integer> aux = new LinkedList<Integer>();
		 if ((a.getData()>n) && (a.getData()/2 != 0)) {
			 aux.add(a.getData());
		 }
		 if (!a.isLeaf()) {
			 for (GeneralTree<Integer> elto:a.getChildren()) {
				 aux.addAll(numerosImparesMayoresQueInOrden(elto,n));
			 }
		 }
		 return aux;
	 }
	 
	 public List<Integer> numerosImparesMayoresQuePostOrden (GeneralTree <Integer> a,Integer n){
		 LinkedList<Integer> aux = new LinkedList<Integer>();
		 if (!a.isLeaf()) {
			 for (GeneralTree<Integer> elto:a.getChildren()){
				 aux.addAll(numerosImparesMayoresQuePostOrden(elto,n));
			 }
		 }
		 if ((a.getData()>n) && (a.getData()/2 != 0)) {
			 aux.add(a.getData()); 
		 }
	     return aux;
	 }
	 
	 public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree <Integer> a,Integer n){
		 LinkedList<Integer> auxL = new LinkedList<Integer>();
		 GeneralTree<Integer> aux;
		 Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
		 cola.enqueue(a);
		 cola.enqueue(null);
		 while (!cola.isEmpty()) {
			 aux = cola.dequeue();
			 if (aux != null) {
				if ((aux.getData() > n) && (aux.getData()/2 != 0)){
					auxL.add(aux.getData());
				} 
				if (aux.hasChildren()){
					for (GeneralTree<Integer> hijo:aux.getChildren()) {
						cola.enqueue(hijo);
					}
				}
			 } else {
				 if (!cola.isEmpty()) {
					 cola.enqueue(null);
				 }
			 }
		 }
		 return auxL;
	 }
}
	

