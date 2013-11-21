define (require, module, exports) ->
	# Solicita la inclusión de backbone para su uso
	Backbone = require "backbone"
	require "backbone-associations"

	# Inicializa los objetos si no existen
	window.App ?= {}
	window.App.User ?= {}

	# Define el modelo del usuario
	class UserModel extends Backbone.AssociatedModel
		# Configura los valores por defecto
		defaults:
			id 		: null
			name 	: null
			age 	: 0
		# Configura la url base de consulta de datos
		urlRoot: app.baseUrlApi  + "user"

	# Define la colección de datos de usuario
	class UserCollection extends Backbone.Collection
		# Modelo individual de datos de usuario
		model: UserModel
		url: app.baseUrlApi  + "user"

	# Define la vista del usuario
	class UserView extends Backbone.View
		# El identificador donde se vaciara el contenido
		el: "#content"
		# El modelo de la vista
		model: new UserModel
		collection: new UserCollection
		# Plantillas que usara la vista
		tmpls:
			userView: "#userview-tmpl"
			userlist: "#userlist-tmpl"
		# función que se ejecuta al inicializar una vista
		initialize: ->
			# Detecta cambios en el modelo y ejecuta diversas funciones a forma de respuesta
			@model.on "change:id", @changeUser, @
			@collection.bind "reset", @resetCollectionUser, @
		# función que se ejecuta como respuesta al cambio de identificador de un usuario
		changeUser: ->
			tmpl = _.template jQuery("#{@tmpls.userView}").html()
			@$el.find(".content-bio").html tmpl(
				model: @model.toJSON()
			)
		resetCollectionUser: ->
			tmpl = _.template jQuery("#{@tmpls.userlist}").html()
			@$el.find(".content-list").html tmpl(
				collection: @collection.toJSON()
			)

	#
	class UserRoute extends Backbone.Router
		initialize: ->
			@view.collection.fetch({reset: true})
		view: new UserView()
		routes:
			"user/view/:id": "actionView"
		actionView: (id) ->
			@view.model.id = id
			@view.model.fetch()

	window.App.User =
		Model: UserModel
		Collection: UserCollection
		Router: UserRoute
		View: UserView