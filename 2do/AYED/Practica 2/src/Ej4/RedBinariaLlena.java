package Ej4;

import Ej1.BinaryTree;

public class RedBinariaLlena {
	BinaryTree<Integer> arbol;
	
	public RedBinariaLlena (BinaryTree<Integer> data) {
		this.arbol = data;
	}
	
	public int retardoReenvio() {
		return calcularRetardo(this.arbol);
	}
	
	private int calcularRetardo(BinaryTree<Integer> arbol) {
		int maxI = 0;
		int maxD = 0;
		if (arbol.isLeaf()) {
			return arbol.getData();
		} else {
			maxI = calcularRetardo(arbol.getLeftChild());
			maxD = calcularRetardo(arbol.getRightChild());
		}
		if (maxI < maxD) {
			return arbol.getData()+maxD;
		}else {
			return arbol.getData()+maxI;
		}
	}
}

