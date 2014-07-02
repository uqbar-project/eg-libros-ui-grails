package ar.edu.libros

import ar.edu.libros.domain.Libro
import ar.edu.libros.exceptions.BusinessException
import ar.edu.libros.exceptions.SystemException
import ar.edu.libros.homes.HomeLibros
import ar.edu.libros.homes.HomeLibrosImpl

class LibroController {

	HomeLibros homeLibros = HomeLibrosImpl.instance

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		def libroBusqueda = mapear(new Libro(), params)
		def libros = homeLibros.getLibros(libroBusqueda)
		[libroInstanceList: libros, libroInstanceTotal: libros.size(), libroBusqueda: libroBusqueda ]
	}

	def create() {
		render(view: "edit", model: [libroInstance: mapear(new Libro(), params), alta: true])
	}

	def save() {
		def libroInstance = null
		def defaultMessage = null
		def id = params.id as Long
		if (id) {
			libroInstance = homeLibros.getLibro(id)
			defaultMessage = "El libro se actualizó correctamente"
		} else {
			libroInstance = new Libro()
			defaultMessage = "El libro se generó correctamente"
		}
		try {
			mapear(libroInstance, params)
			homeLibros.actualizarLibro(libroInstance)
			flash.message = defaultMessage
			redirect(action: "list")
		} catch (BusinessException e) {
			this.handleEditionError(libroInstance, e)
		} catch (Exception e) {
			this.handleEditionError(libroInstance, new SystemException("Ha ocurrido un error. Consulte al administrador"))
		}
	}

	def handleEditionError(libro, exception) {
		render(view: "edit", model: [libroInstance: libro, alta: libro.id == null, exception: exception])
	}

	def show(Long id) {
		edit(id)
	}

	def edit(Long id) {
		def libroInstance = homeLibros.getLibro(id)
		if (!libroInstance) {
			flash.message = "Libro " + id + " no encontrado"
			redirect(action: "list")
		}
		else {
			[libroInstance: libroInstance]
		}
	}

	def delete(Long id) {
		def libroInstance = homeLibros.getLibro(id)
		try {
			homeLibros.eliminarLibro(libroInstance)
			flash.message = "Libro eliminado"
			redirect(action: "list")
		} catch (Exception e) {
			flash.message = "Hubo un error al eliminar el libro"
			redirect(action: "show", id: id)
		}
	}

	def mapear(libro, params) {
		libro.autor = params.autor
		libro.titulo = params.titulo
		libro.editorial = params.editorial
		if (params.anioPublicacion) {
			libro.anioPublicacion = new Integer(params.anioPublicacion)
		}
		libro
	}
}
