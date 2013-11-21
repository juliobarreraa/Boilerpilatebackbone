define (require, module, exports) ->
	Backbone = require "backbone"
	require "backbone-associations"

	window.App ?= {}
	window.App.Toy ?= {}

	class ToyModel extends Backbone.Model
		urlRoot: app.baseUrlApi + "toys"
		relations: [
		    type: Backbone.One
		    key: 'user'
		    relatedModel: App.User.Model
		    map: (id) ->
		    	console.log id
		]
		defaults:
			id : 0
			user_id : 0
			user : {}
			name : ""
			price: 0

	class ToyCollection extends Backbone.Collection
		model: ToyModel
		url: app.baseUrlApi + "toys"

	###
	class ToyRelation extends Backbone.AssociatedModel
	  relations: [
	        type: Backbone.One
	        key: 'user'
	        relatedModel: App.User.Model
	        map: (id) ->
	        	console.log @
	  ]
	  defaults:
	    name : ""
	    number : 0
	    user : {}

	#console.log toyRelation
	###
	class ToyView extends Backbone.View
		el: "#content"
		tmpls:
			toylist: "#toylist-tmpl"
			toyview: "#toyview-tmpl"
		collection: new ToyCollection
		model: new ToyModel
		initialize: ->
			@collection.bind "reset", @collectionReset, @
			@model.on "change", @changeToy, @
		changeToy: ->
			tmpl = _.template jQuery("#{@tmpls.toyview}").html()
			console.log @model.attributes.user
			@$el.find(".content-toy").html tmpl(
				model: @model.toJSON()
			)
		collectionReset: ->
			tmpl = _.template jQuery("#{@tmpls.toylist}").html()
			@$el.find(".toy-list").html tmpl(
				collection: @collection.toJSON()
			)

	class ToyRouter extends Backbone.Router
		initialize: ->
			@view.collection.fetch({reset: true})
		view: new ToyView
		routes:
			"toy/view/:id": "actionView"
		actionView: (id) ->
			@view.model.id = id
			@view.model.fetch()

	window.App.Toy =
		Model: ToyModel
		Collection: ToyCollection
		View: ToyView
		Router: ToyRouter