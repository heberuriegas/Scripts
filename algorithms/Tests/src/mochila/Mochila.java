package mochila;

import java.util.HashSet;
import java.util.Set;

public class Mochila{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final int CAPACIDAD = 30;
	private static int pesoActual = 0;
	private static int valorActual = 0;
	
	private static Set<Objeto> objetos = new HashSet<Objeto>();
	

	public static int getCapacidad() {
		return CAPACIDAD;
	}
	
	public static int getValorActual() {
		return valorActual;
	}

	public static int getPesoActual() {
		return pesoActual;
	}
	
	public static void addObjeto(Objeto objeto){
		if(pesoActual+objeto.getPeso() <= CAPACIDAD){
			if(objetos.add(objeto)){
				pesoActual += objeto.getPeso();
			}
		}
	}
	
	public static void removeObjeto(Objeto objeto){
		if(objetos.remove(objeto)){
			pesoActual -= objeto.getPeso();
		}
	}
	
	public static Set<Objeto> getObjetos() {
		return objetos;
	}

	public static void setObjetos(HashSet<Objeto> objetos) {
		Mochila.objetos = objetos;
	}
}
