package Ej4;

import Ej1.*;
import Ej1.Queue;

import java.util.*;

public class AnalizadorArbol {
	
	public double devolverMaximoPromedio (GeneralTree<AreaEmpresa>arbol) {
		Queue<GeneralTree<AreaEmpresa>> cola = new Queue<GeneralTree<AreaEmpresa>>();
		GeneralTree<AreaEmpresa> aux;
		cola.enqueue(arbol);
		cola.enqueue(null);
		int cont = 0;
		int cant = 0;
		double maxprom = 0;
		int maxnivel = 0;
		int nivel = 0;
		while (!cola.isEmpty()) {
			aux = cola.dequeue();
			if (aux != null) {
				cant ++;
				cont += aux.getData().getTardanza();
				if (aux.hasChildren()){
					List<GeneralTree<AreaEmpresa>> child = aux.getChildren();
					for (GeneralTree<AreaEmpresa> elto:child) {
						cola.enqueue(elto);
					}
				}
				if (cant/cont > maxprom) {
					maxprom  = cant/cont;
					maxnivel = nivel;
				}
			} else {
				if (!cola.isEmpty()) {
					cola.enqueue(null);
					nivel ++;
					cant = 0;
					cont = 0;
				}
			}
		}	
		System.out.println("el nivel: "+maxnivel+", tiene el mayor promedio: "+maxprom);
		return maxprom;
	}
}
