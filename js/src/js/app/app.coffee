define (require, module, exports) ->
	require "cs!helper"
	require "cs!user"
	require "cs!movie"
	require "cs!toy"
	require "cs!pet"

	new App.User.Router()
	new App.Movie.Router()
	new App.Toy.Router()
	new App.Pet.Router()
	
	Backbone.history.start()