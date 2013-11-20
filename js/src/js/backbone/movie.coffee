define (require, module, exports) ->
	Backbone = require "backbone"

	window.App ?= {}
	window.App.Movie ?= {}


	class MovieModel extends Backbone.Model
		defaults:
			id 			: 0
			user_id 	: 0
			name 		: ''
			year 		: 0
		urlRoot : app.baseUrlApi + "movies"

	class MovieCollection extends Backbone.Collection
		model: MovieModel
		url: app.baseUrlApi + "movies"

	class MovieView extends Backbone.View
		el: "#content"
		model: new MovieModel
		collection: new MovieCollection
		tmpls:
			movielist: "#movielist-tmpl"
			moviedetail: "#movieview-tmpl"
		initialize: ->
			@collection.bind "reset", @collectionReset, @
			@model.on "change:id", @changeMovie, @
		changeMovie: ->
			tmpl = _.template jQuery("#{@tmpls.moviedetail}").html()
			@$el.find(".content-movie").html tmpl(
				model: @model.toJSON()
			)
		collectionReset: ->
			tmpl = _.template jQuery("#{@tmpls.movielist}").html()
			@$el.find(".movie-list").html tmpl(
				collection: @collection.toJSON()
			)

	class MovieRouter extends Backbone.Router
		view: new MovieView()
		initialize: ->
			@view.collection.fetch({reset:true})
		routes:
			"movie/view/:id": "actionView"
		actionView: (id) ->
			@view.model.id = id
			@view.model.fetch()

	window.App.Movie = 
		Router: MovieRouter
		Collection: MovieCollection
		View: MovieView
		Model: MovieModel
