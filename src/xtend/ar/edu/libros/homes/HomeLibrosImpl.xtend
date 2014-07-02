package ar.edu.libros.homes

import ar.edu.libros.domain.Libro
import java.util.ArrayList
import java.util.List

class HomeLibrosImpl implements HomeLibros {

	List<Libro> libros

	/** singleton **/
	static HomeLibrosImpl instance

	private new() {
		libros = new ArrayList<Libro>
	}

	static def getInstance() {
		if(instance == null) {
			instance = new HomeLibrosImpl()
		}
		instance
	}

	/** fin singleton **/
	
	override agregarLibro(Libro libro) {
		libro.id = new Long(libros.size() + 1)
		libros.add(libro)
	}

	override actualizarLibro(Libro libroActualizado) {
		libroActualizado.validar
		if(libroActualizado.id == null) {
			this.agregarLibro(libroActualizado)
		} else {
			this.doActualizarLibro(libroActualizado)
		}
	}

	def doActualizarLibro(Libro libroActualizado) {
		val unLibro = this.getLibro(libroActualizado.id)
		unLibro.actualizarCon(libroActualizado)
	}

	override eliminarLibro(Libro libro) {
		libros.remove(this.getLibro(libro.id))
	}

	override getLibro(Long id) {
		libros.findFirst[libro|libro.id.equals(id)].copy
	}

	override getLibros(Libro libroBusqueda) {
		libros.filter[libro|libro.matchea(libroBusqueda)].toList.map [ it.copy ]
	}

}
