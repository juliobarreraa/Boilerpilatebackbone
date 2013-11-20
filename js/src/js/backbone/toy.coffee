define (require, module, exports) ->
	Backbone = require "backbone"
	require "backbone-relational"

	window.App ?= {}
	window.App.Toy ?= {}

	ToyModel = Backbone.RelationalModel.extend
		urlRoot: app.baseUrlApi + "toys"

	ToyModel.setup()

	class ToyCollection extends Backbone.Collection
		model: ToyModel
		url: app.baseUrlApi + "toys"

	#class ToyRelationalModel extends Backbone.RelationalModel
	###
		relations: [
			type: Backbone.HasOne
			collectionType: 'ToyCollection'
			relatedModel: 'ToyModel'
			key: 'toy'
			reverseRelation:
				key: 'livesIn',
				includeInJSON: 'id'
		]
	ToyRelationalModel.setup()


	toy = new ToyRelationalModel( { name: 'Buzz Light Year' } );

	console.log toy
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
		#Relational: ToyRelationalModel
		View: ToyView
		Router: ToyRouter