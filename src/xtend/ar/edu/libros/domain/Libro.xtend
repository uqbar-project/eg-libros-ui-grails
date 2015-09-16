package ar.edu.libros.domain

import ar.edu.libros.exceptions.BusinessException
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Libro implements Cloneable {

	Long id
	String autor
	String titulo
	String editorial
	Integer anioPublicacion

	new() {
		autor = ""
		titulo = ""
		editorial = ""
	}

	new(String autor, String titulo, String editorial, Integer anioPublicacion) {
		this.autor = autor
		this.titulo = titulo
		this.editorial = editorial
		this.anioPublicacion = anioPublicacion
	}

	override toString() {
		titulo
	}

	def void validar() {
		if (autor == null || autor.equals("")) {
			throw new BusinessException("autor", "Debe completar el autor")
		}
		if (titulo == null || titulo.equals("")) {
			throw new BusinessException("titulo", "Debe completar el título")
		}
		if (editorial == null || editorial.equals("")) {
			throw new BusinessException("editorial", "Debe completar la editorial")
		}
		if (anioPublicacion == null) {
			throw new BusinessException("anioPublicacion", "Debe completar el año de publicación")
		} else {
			if (anioPublicacion > new Date().year + 1900) {
				throw new BusinessException("anioPublicacion", "El año de publicación no puede ser posterior al año actual")
			}
		}
	}

	def actualizarCon(Libro libro) {
		this.autor = libro.autor
		this.titulo = libro.titulo
		this.editorial = libro.editorial
		this.anioPublicacion = libro.anioPublicacion
	}

	def matchea(Libro libro) {
		matcheaAutor(libro) && matcheaTitulo(libro)
	}

	def matcheaTitulo(Libro libro) {
		libro.titulo == null || titulo.contains(libro.titulo)
	}

	def matcheaAutor(Libro libro) {
		libro.autor == null || autor.contains(libro.autor)
	}

	def Libro copy() {
		super.clone as Libro
	}

}