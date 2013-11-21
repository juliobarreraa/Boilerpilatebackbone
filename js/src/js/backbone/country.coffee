define (require, module, exports) ->
	Backbone = require "backbone"

	window.App ?= {}
	window.App.Country ?= {}


	class CountryModel extends Backbone.Model
		defaults:
			id 		: 0
			name 	: ''
			capital	: ''
		urlRoot: app.baseUrlApi + "country"

	class CountryCollection extends Backbone.Collection
		model: CountryModel
		url: app.baseUrlApi + "country"




	class CountryView extends Backbone.View
		el: "#content"
		model: new CountryModel
		collection: new CountryCollection
		tmpls:
			countrylist: "#countrylist-tmpl"
			countryView: "#contryview-tmpl"

		initialize: ->
			@collection.bind "reset", @collectionReset, @ 
			@model.on "change:id", @changeCountry, @
		changeCountry: -> 
			tmpl = _.template jQuery("#{@tmpls.countryView}").html()
			@$el.find(".content-country").html tmpl(
				model: @model.toJSON())
		collectionReset: -> 
			tmpl = _.template jQuery("#{@tmpls.countrylist}").html()
			@$el.find(".country-list").html tmpl(
				collection:@collection.toJSON())

	class CountryRouter extends Backbone.Router
		view: new CountryView()
		initialize: ->
			@view.collection.fetch({reset:true})
		routes:
			"country/view/:id": "actionView"
		actionView: (id) ->
			@view.model.id =id
			@view.model.fetch()


	window.App.Country =
		Router: CountryRouter
		Collection: CountryCollection
		View: CountryView
		Model: CountryModel