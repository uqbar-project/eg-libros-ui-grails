package ar.edu.libros.exceptions

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BusinessException extends RuntimeException {

	String campoOrigen
	
	new(String campoOrigen, String msg) {
		super(msg)
		this.campoOrigen = campoOrigen
	}	
	
}