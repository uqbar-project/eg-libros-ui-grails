<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="body" style="width: 90%; padding: 15pt;">
		<g:render template="menuSuperior" model="[entityName: entityName]"></g:render>
		<g:render template="titulo" model="['titulo': message(code: 'default.show.label', args: [entityName])]"/>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form class="form-horizontal" method="post">
			<div class="control-group">
				<label class="control-label" for="autor"><g:message code="libro.autor.label" default="Autor" />&nbsp;&nbsp; </label> <span class="input-xlarge uneditable-input"> ${libroInstance?.autor} </span>
			</div>
			<div class="control-group">
				<label class="control-label" for="titulo"><g:message code="libro.titulo.label" default="Titulo" />&nbsp;&nbsp; </label> <span class="input-xxlarge uneditable-input"> ${libroInstance?.titulo} </span>
			</div>
			<div class="control-group">
				<label class="control-label" for="editorial"><g:message code="libro.editorial.label" default="Editorial" />&nbsp;&nbsp; </label> <span class="input-xlarge uneditable-input"> ${libroInstance?.editorial} </span>
			</div>
			<div class="control-group">
				<label class="control-label" for="editorial"><g:message code="libro.anioPublicacion.label" default="A&ntilde;o de Publicaci&oacute;n" />&nbsp;&nbsp; </label> <span class="input-large uneditable-input"> ${libroInstance?.anioPublicacion} </span>
			</div>
			<div class="buttons">
				<g:hiddenField name="id" value="${libroInstance?.id}" />
				<g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.edit.label', args: [entityName])}"/>
				<!--  se pueden poner botones con íconos como éste
				<button class="btn btn-primary" name="_action_edit" value="Editar">
					<i class="icon-file icon-white"></i>Editar
				</button>
				 -->
				<g:actionSubmit class="btn btn-primary" action="delete" value="${message(code: 'default.delete.label', args: [entityName])}"/>
				<g:link class="btn btn-primary" action="list">
					<g:message code="default.cancel.label" />
				</g:link>
			</div>
		</g:form>
	</div>
</body>
</html>
