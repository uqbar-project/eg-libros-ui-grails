package ar.edu.libros

import org.springframework.dao.DataIntegrityViolationException

import ar.edu.libros.exceptions.DomainObjectNotFoundException
import ar.edu.libros.exceptions.UpdateException

class LibroController {

	def LibroService

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = params.max = Math.min(max ?: 10, 100)
		def libroBusqueda = new Libro(params)
		def libros = libroService.getLibros(params, libroBusqueda)
		[libroInstanceList: libros, libroInstanceTotal: params.libroInstanceTotal, libroBusqueda: libroBusqueda ]
	}

	def create() {
		render(view: "edit", model: [libroInstance: new Libro(params), alta: true])
	}

	def save() {
		def libroInstance = null
		def defaultMessage = null
		def id = params.id
		def version = params.version
		if (id) {
			libroInstance = libroService.getLibro(id)
			defaultMessage = "El libro se actualizó correctamente"
		} else {
			libroInstance = new Libro()
			defaultMessage = "El libro se generó correctamente"
		}
		try {
			libroInstance.properties = params
			libroInstance.validar()
			if (libroService.actualizarLibro(libroInstance)) {
				flash.message = defaultMessage
				redirect(action: "list")
			} else {
				render(view: "edit", model: [libroInstance: libroInstance])
			}
		} catch (UpdateException e) {
			flash.message = "Hubo un error al actualizar el libro"
			redirect(action: "show", id: libroInstance.id)
		} catch (ConcurrentModificationException e) {
			render(view: "edit", model: [libroInstance: libroInstance, alta: false])
		}
	}

	def show(Long id) {
		edit(id)
	}

	def edit(Long id) {
		def libroInstance = libroService.getLibro(id)
		if (!libroInstance) {
			flash.message = "Libro " + id + " no encontrado"
			redirect(action: "list")
		}
		else {
			[libroInstance: libroInstance]
		}
	}

	def delete(Long id) {
		def libroInstance = libroService.getLibro(id)
		try {
			libroService.eliminarLibro(libroInstance)
			flash.message = "Libro eliminado"
			redirect(action: "list")
		} catch (Exception e) {
			flash.message = "Hubo un error al eliminar el libro"
			redirect(action: "show", id: id)
		}
	}
}
