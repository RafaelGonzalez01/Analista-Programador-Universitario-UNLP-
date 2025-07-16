package Ej7;
import Ej1.*;
import java.util.*;

public class Caminos {
	
	private GeneralTree<Integer> arbol;
	
	public Caminos(GeneralTree<Integer> aux) {
		this.arbol = aux;
	}
	
	 public List<Integer> caminoAHojaMasLejana (){
		 List<Integer> maxCamino = new LinkedList<Integer>();
		 if (!this.arbol.isLeaf() && this.arbol != null) {
			 caminoAHojaMasLejana(arbol, maxCamino, new LinkedList<>());
		 }
		 return maxCamino;
	 }
	
	 private List<Integer> caminoAHojaMasLejana(GeneralTree<Integer> nodo,List<Integer> maxCamino,List<Integer> camino){
		 camino.add(nodo.getData());
		 if (nodo.isLeaf() && (camino.size() > maxCamino.size())) {
			 maxCamino = camino;
		 } else {
			 for (GeneralTree<Integer> elto: nodo.getChildren()) {
				 caminoAHojaMasLejana(elto,maxCamino,camino);
				 camino.removeLast();
			 }
		 }
		 return maxCamino;
	 }
}


