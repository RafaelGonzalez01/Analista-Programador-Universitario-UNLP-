package Ej3;

import java.util.*;

import Ej1.BinaryTree;

public class ContadorArbol {
	private BinaryTree<Integer> arbol;
	
	public ContadorArbol(BinaryTree<Integer> data) {
		this.arbol = data;
	}
	
	public List<Integer> numerosPares() {
		List<Integer> paresinOrden = new ArrayList<>();
		List<Integer> paresPostOrden = new ArrayList<>();
		System.out.println("pares inOrden: ");
		paresInOrden(this.arbol,paresinOrden);
		imprimir(paresinOrden);
		System.out.println("pares postOrden: ");
		paresPostOrden(arbol,paresPostOrden);
		imprimir(paresPostOrden);
		return paresinOrden;	
	}	
	
	private void imprimir(List<Integer> lista) {
		for (int i = 0; i < lista.size(); i++) {
			System.out.print(lista.get(i));
		}	
	}	

	private void paresInOrden(BinaryTree<Integer> arbol,List<Integer> pares) {
		if (!arbol.isEmpty()) {
			if (arbol.hasleftChild()) {
				paresInOrden(arbol.getLeftChild(),pares);
			}
			if (arbol.getData()/2 == 0) {
				pares.add(arbol.getData());
			} 
			if (arbol.hasRightChild()) {
				paresInOrden(arbol.getRightChild(),pares);
			}
		}
	}
	
	private void paresPostOrden(BinaryTree<Integer> arbol,List<Integer> pares) {
		if (!arbol.isEmpty()) {
			if (arbol.hasRightChild()) {
				paresPostOrden(arbol.getRightChild(),pares);
			}
			if (arbol.hasleftChild()) {
				paresPostOrden(arbol.getLeftChild(),pares);
			}
			if (arbol.getData()/2 == 0) {
				pares.add(arbol.getData());
			}
		}
	}
}


