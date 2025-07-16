package Ej6;
import Ej1.*;

public class RedDeAguaPotable {
	
	private GeneralTree<Character> arbol;
	
	public RedDeAguaPotable(GeneralTree<Character> aux){
		this.arbol = aux;
	}
	
	 public double minimoCaudal(double caudal) {
		 if (caudal <= 0 || arbol == null || arbol.isEmpty()) {
			 return 0;
		 }
		 double min = 0;
		 return minimoCaudal(caudal,this.arbol,min);
	 }
	 
	 private double minimoCaudal(double caudal,GeneralTree<Character> nodo,double min) {
		 if (!nodo.isLeaf()) {
			 caudal = caudal / nodo.getChildren().size();
			 for (GeneralTree<Character> elto: nodo.getChildren()){
				 min = Math.min(caudal,minimoCaudal(caudal,elto,min));
			 }
		 }
		 return min;
	 }

	
	
}
