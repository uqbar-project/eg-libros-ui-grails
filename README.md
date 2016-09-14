
# Actualización de Libros en Grails

<img src="https://cloud.githubusercontent.com/assets/4549002/18517870/40a22aee-7a74-11e6-99e0-211e44d7bacf.png" width="100px;" height="100px;"/>

## Explicación

Se encuentra en [este apunte](https://docs.google.com/document/d/1g9Q7TxWU5hJu6_V8r63eSCek1EC1PCTL-f310XzDANE/edit#heading=h.z0vrvi6xk0zu)
donde se cuenta la navegación entre

* la pantalla de búsqueda
* y la edición/consulta de un libro

## Consideraciones

* Instalar el plugin de xtend a partir de Install New Software... utilizando [este update site](http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/)
* El objeto de dominio está en Xtend
* También el repositorio (objeto de acceso a datos)
* Los controllers y las vistas son propias de Grails

## Versiones actuales

* Grails 2.4.2
* en un entorno GGTS 3.6.0
* con Twitter Boostrap 3.2.0
* con Xtend 2.10.0

### Para que funcione en GGTS 3.6.0

La JDK de Grails puede ser 1.8, pero debe configurarse el compilador de Xtend para que compile con compatibilidad Java 7 o menor por un tema de retrocompatibilidad del IDE de Grails. Esto se hace definiendo

Window > Preferences > Xtend > Compiler

y destildando la opción "Use source compatibility level from Java settings", hay que seleccionar entre las opciones Java 7.

![grails-xtend-integration](https://cloud.githubusercontent.com/assets/4549002/18527938/38b8b54a-7a9d-11e6-9a57-0fdcd988d480.png)
