define (require, module, exports) ->
	Backbone = require "backbone"

	window.App ?= {}
	window.App.Pet ?= {}

	class PetModel extends Backbone.Model
		urlRoot: app.baseUrlApi + "pets"

	class PetCollection extends Backbone.Collection
		model: PetModel
		url: app.baseUrlApi + "pets"

	class PetView extends Backbone.View
		el: "#content"
		tmpls:
			petList: "#petlist-tmpl"
			petDetail: "#petDetail-tmpl"
		model: new PetModel
		collection: new PetCollection
		initialize: ->
			@collection.bind "reset", @collectionReset, @
			@model.on "change:id", @changePet, @
		changePet: ->
			tmpl = _.template jQuery("#{@tmpls.petDetail}").html()
			@$el.find(".content-pet").html tmpl(
				model: @model.toJSON()
			)
		collectionReset: ->
			tmpl = _.template jQuery("#{@tmpls.petList}").html()
			@$el.find(".pet-list").html tmpl(
				collection: @collection.toJSON()
			)


	class PetRouter extends Backbone.Router
		view: new PetView
		initialize: ->
			@view.collection.fetch({reset: true})
		routes:
			"pet/view/:id": "actionView"
		actionView: (id) ->
			@view.model.id = id
			@view.model.fetch()


	window.App.Pet =
		Model: PetModel
		Collection: PetCollection
		View: PetView
		Router: PetRouter