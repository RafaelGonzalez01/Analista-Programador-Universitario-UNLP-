package Ej1;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
	public int altura() {	 
		Queue<GeneralTree<T>> cola = new Queue<GeneralTree<T>>(); 
		int nivel = 0;
		GeneralTree<T> aux;
		if (this != null) {
			cola.enqueue(this);
			cola.enqueue(null);
			while (!cola.isEmpty()) {
				aux = cola.dequeue();
				if (aux != null) {
					for (GeneralTree<T> elto:aux.getChildren()) {
						cola.enqueue(elto);
					}
				} else {
					if (!cola.isEmpty()) {
						cola.enqueue(null);
						nivel++;
					}
				}
			}
		}
		return nivel;
	}
	
	public int nivel(T dato){
		Queue<GeneralTree<T>> cola = new Queue<GeneralTree<T>>();
		int nivel = 0;
		GeneralTree<T> aux;
		if (this != null) {
			cola.enqueue(this);
			cola.enqueue(null);
			while (!cola.isEmpty()) {
				aux = cola.dequeue();
				if (aux != null) {
					if (aux.data == dato) {
						return nivel;
					} else {
						for (GeneralTree<T> elto:aux.getChildren()) {
							cola.enqueue(elto);
						}
					}
					
				} else {
					if (!cola.isEmpty()) {
						cola.enqueue(null);
						nivel ++;
					}
				}
			}
		}
		return -1;
	  }

	public int ancho(){
		int max = 0;
		int nodosnivel = 0;
		GeneralTree<T> aux;
		Queue<GeneralTree<T>> cola = new Queue<GeneralTree<T>>();
		cola.enqueue(this);
		cola.enqueue(null);
		while (!cola.isEmpty()) {
			aux = cola.dequeue();
			if (aux != null) {
				for (GeneralTree<T> elto:aux.getChildren()) {
					cola.enqueue(elto);
					nodosnivel ++;
				} 
			} else {
				if (!cola.isEmpty()) {
					cola.enqueue(null);
					if (nodosnivel > max) {
						max = nodosnivel;
					}
					nodosnivel = 0;
				}
				
			}
		}
		return max;
	}
	
	 public boolean esAncestro(T a, T b) {
		 if (a == null || b == null || this.isEmpty()) {
			 return false;
		 }
		 GeneralTree<T> aux = esAncestro(this,a);
		 if (aux == null) {
			 return false;
		 }
		 return esAncestro(aux,b) != null;
	 }
	 
	 private GeneralTree<T> esAncestro (GeneralTree<T> nodo, T dato){
		 if (nodo.getData().equals(dato)) {
			 return nodo;
		 }
		 GeneralTree<T> aux = null;
		 Iterator<GeneralTree<T>> it = nodo.getChildren().iterator();
		 while (it.hasNext() && aux == null) {
			 aux = esAncestro(it.next(),dato);
		 }
		 return aux;
	 }
}