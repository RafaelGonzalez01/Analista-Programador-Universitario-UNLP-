package Ej1;

import java.util.*;

// porque no me anda! import Practica_1.Ejercicio_8.*;

public class BinaryTree <T>{
	private T data;
	private BinaryTree<T>  leftChild;
	private BinaryTree<T> rightChild;
	
	public BinaryTree() {
		super();
	} 
	
	public BinaryTree(T data) {
		this.data = data;
	}
	
	public T getData() {
		return this.data;
	}
	
	public void setData(T data) {
		this.data = data;
	}
	
	public BinaryTree<T> getRightChild(){
		return this.rightChild;
	}
	
	public BinaryTree<T> getLeftChild(){
		return this.leftChild;
	}
	
	public void addRightChild(BinaryTree<T> rightChild) {
		this.rightChild = rightChild;
	}
	
	public void addleftChild(BinaryTree<T> leftChild) {
		this.leftChild = leftChild;
	}
	
	public void removeRightChild() {
		this.rightChild = null;
	}
	
	public void removeleftChild() {
		this.leftChild = null;
	}
	
	public boolean isEmpty() {
		return data == null && rightChild == null && leftChild == null; 
	}
	
	public boolean isLeaf() {
		return rightChild == null && leftChild == null;
	}
	
	public boolean hasRightChild() {
		return rightChild != null;
	}
	
	public boolean hasleftChild() {
		return leftChild != null;
	}
	
	public String toString() {
		return "Binary Tree {" + " dato: " + data + "," + "leftChild: " + leftChild + "," + "rightChild: " + rightChild + " }";
	}
	
	public int contarHojas() {
		if(this.isEmpty()) {
			return 0;
		} else {
			if (this.isLeaf()) {
				return 1;
			} else {
				return leftChild.contarHojas() + rightChild.contarHojas();
				}
			}
	}

	public BinaryTree<T> espejo(){
		BinaryTree<T> aux = new BinaryTree<T>();
        if (!this.isEmpty()){ //si el nodo no es null
            aux.setData(this.data); //lo agrega
            
            if (this.hasleftChild()){
                aux.addRightChild(this.leftChild.espejo()); //si tiene hijo izq, 
            }
            if (this.hasRightChild()){
                aux.addleftChild(this.rightChild.espejo());
            }
        }
        return aux;
	}
    
		/*BinaryTree<T> arbol = new BinaryTree<T>();
		arbol.data = this.getData();
		espejoPrivado(this,arbol);
		return arbol;
	}
	
	private void espejoPrivado(BinaryTree<T> arbol,BinaryTree<T> arbolNuevo){
		if (! arbol.isEmpty()) {
			//si tiene hijo izquierdo le asigno ese nodo al derecho del nuevo arbol, y llamo a la recurscion desde ese nodo que se que tiene y el contrario del arbol nuevo
			if (arbol.hasleftChild()) {
				BinaryTree<T> nuevoDerecho = new BinaryTree<T>(); // Crear nuevo nodo para el hijo derecho del espejo
				nuevoDerecho.setData(arbol.getLeftChild().getData()); // Asignar el dato
				arbolNuevo.addRightChild(nuevoDerecho); // diferencias con: arboNuevo.addRightChild(arbol.getRightChild);
				espejoPrivado(arbol.getLeftChild(),arbolNuevo.getRightChild());
			}
			//lo mismo con el derecho
			if (arbol.hasRightChild()) {
				BinaryTree<T> nuevoIzquierdo = new BinaryTree<T>();
				nuevoIzquierdo.setData(arbol.getRightChild().getData());
				arbolNuevo.addleftChild(nuevoIzquierdo);
				espejoPrivado(arbol.getRightChild(),arbolNuevo.getLeftChild());
			}
		}
	}*/
	
	public void entreNiveles(int a,int b) {
		int nivel = 0;
		if (! this.isLeaf() && a > 0) {
			
		}
	}
	
	public void printPreorden() {
		System.out.print(this.getData() + "///");
		if (this.hasleftChild()) {
			this.leftChild.printPreorden();
		}
		if (this.hasRightChild()) {
			this.rightChild.printPreorden();
		}
	}
	
	public void printPostorden() {
		if (this.hasRightChild()) {
			this.rightChild.printPostorden();
		}
		if (this.hasleftChild()) {
			this.leftChild.printPostorden();
		}
		System.out.print(this.getData() + "///");
	}
	
	public static void main(String[] args) {
		BinaryTree<Integer> ab = new BinaryTree<>(40);
		BinaryTree<Integer> hijoIzquierdo = new BinaryTree<>(25);
		hijoIzquierdo.addleftChild(new BinaryTree<Integer>(10));
		hijoIzquierdo.addRightChild(new BinaryTree<Integer>(32));
		BinaryTree<Integer> hijoDerecho = new BinaryTree<>(78);
		ab.addleftChild(hijoIzquierdo);
		ab.addRightChild(hijoDerecho);
		System.out.println("arbol preorden: ");
		ab.printPreorden();
		System.out.println("arbol postorden: ");
		ab.printPostorden();
		BinaryTree<Integer> arbolEspejo = ab.espejo();
		System.out.println("arbol espejo: ");
		arbolEspejo.printPreorden();
	}
}
