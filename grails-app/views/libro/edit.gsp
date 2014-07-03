<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Busqueda de libros</title>
</head>
<body>
	<div class="body" style="width: 90%; padding: 15pt;">
		<g:render template="menuSuperior"></g:render>
		
		<g:if test="${alta}">
			<g:set var="titulo" value="Crear libro"/>
		</g:if>
		<g:else>
			<g:set var="titulo" value="Actualizar libro"/>
		</g:else>
		<g:render template="titulo" model="['titulo': titulo]"/>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:if test="${exception}">
			<div class="alert alert-error">
				${exception.message}
			</div>
		</g:if>
		<form class="form-horizontal" action="save" method="post">
			<g:hiddenField name="id" value="${libroInstance?.id}" />
			<div class="control-group ${exception?.campoOrigen?.equalsIgnoreCase('autor') ? 'error' : ''}">
				<label class="control-label" for="autor">Autor</label>
				<div class="controls">
					<input class="input-large" type="text" name="autor" id="autor" placeholder="Autor" value="${libroInstance?.autor}" />
				</div>
			</div>
			<div class="control-group ${exception?.campoOrigen?.equalsIgnoreCase('titulo') ? 'error' : ''}">
				<label class="control-label" for="titulo">T&iacute;tulo</label>
				<div class="controls">
					<input class="input-xxlarge" type="text" name="titulo" id="titulo" placeholder="T&iacute;tulo" value="${libroInstance?.titulo}" />
				</div>
			</div>
			<div class="control-group ${exception?.campoOrigen?.equalsIgnoreCase('editorial') ? 'error' : ''}">
				<label class="control-label" for="editorial">Editorial</label>
				<div class="controls">
					<input class="input-large" type="text" name="editorial" id="editorial" placeholder="Editorial" value="${libroInstance?.editorial}" />
				</div>
			</div>
			<div class="control-group ${exception?.campoOrigen?.equalsIgnoreCase('anioPublicacion') ? 'error' : ''}">
				<label class="control-label" for="editorial">A&ntilde;o de Publicaci&oacute;n</label>
				<div class="controls">
					<input class="input-medium" type="text" name="anioPublicacion" id="anioPublicacion" placeholder="A&ntilde;o de Publicaci&oacute;n" value="${libroInstance?.anioPublicacion}" />
				</div>
			</div>
			<div class="buttons">
				<input type="submit" class="btn btn-primary" value="Aceptar" />
				<g:link class="btn btn-primary" action="list">
					Cancelar
				</g:link>
			</div>
		</form>
	</div>
</body>
</html>