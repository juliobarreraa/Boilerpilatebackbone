define (require, module, exports) ->
	require "cs!helper"
	require "cs!user"
	require "cs!movie"
	require "cs!toy"
	require "cs!country"
	require "cs!pet"

	new App.User.Router()
	new App.Movie.Router()
	new App.Toy.Router()
	new App.Country.Router()
	new App.Pet.Router()

	Backbone.history.start()