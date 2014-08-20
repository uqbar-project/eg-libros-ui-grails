package ar.edu.libros

import grails.converters.JSON
import ar.edu.libros.domain.Libro

class LibroController {

    def index() { }
	
	def list() {
		def result = [new Libro(titulo: "10 cuentos peregrinos", id: 1, autor: "Gabriel García Márquez"),
		 new Libro(titulo: "Fundación", id: 2, autor: "Isaac Asimov"),
		 new Libro(titulo: "Manual del viajero intergaláctico", id: 3, autor: "Douglas Adams"),
		 new Libro(titulo: "1984", id: 4, autor: "George Orwell")]
		
		render result as JSON
	}
}
