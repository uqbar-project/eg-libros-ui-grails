package ar.edu.libros.exceptions

import java.lang.RuntimeException

/**
 * Representa un error de sistema
 */
class SystemException extends RuntimeException {
	
	new(String msg, Throwable cause) {
		super(msg, cause)
	}
	
	def getCampoOrigen() {
		null
	}
	
}