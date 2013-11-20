define (require, module, exports) ->
	require "cs!helper"
	require "cs!user"
	require "cs!movie"
	require "cs!toy"

	new App.User.Router()
	new App.Movie.Router()
	new App.Toy.Router()
	
	Backbone.history.start()