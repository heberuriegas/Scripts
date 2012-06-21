package mochila;

import java.util.ArrayList;
import java.util.List;

public class Mesa {
	
	private List<Objeto> objetos = new ArrayList<Objeto>();
	
	public Mesa(){
		
		/*
		objetos.add(new Objeto(8,4));
		objetos.add(new Objeto(1,6));
		objetos.add(new Objeto(10,2));
		objetos.add(new Objeto(12,21));
		objetos.add(new Objeto(7,23));
		objetos.add(new Objeto(16,2));
		objetos.add(new Objeto(13,21));
		objetos.add(new Objeto(7,21));
		objetos.add(new Objeto(11,5));
		objetos.add(new Objeto(4,21));
		objetos.add(new Objeto(14,23));
		*/
		
		objetos.add(new Objeto(10,2));
		objetos.add(new Objeto(8,4));
		objetos.add(new Objeto(1,6));
		objetos.add(new Objeto(20,2));
		objetos.add(new Objeto(12,21));
		objetos.add(new Objeto(14,23));
		
	}

	public List<Objeto> getObjetos() {
		return objetos;
	}

	/*
	public void setObjetos(ArrayList<Objeto> objetos) {
		this.objetos = objetos;
	}
	*/
}
