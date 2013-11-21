app = app || {};
url = typeof app.baseUrlDeveloper === "undefined" ? "" : app.baseUrlDeveloper;

require.config({
	// Configuramos la url base partiendo de las
	// librerias del proyecto
	baseUrl: (typeof url == "undefined" ? "js/vendor" : url + "js/vendor"),
	paths: {
		app: "../app",
		jquery: "jquery.min",
		cs: "cs",
		backbone: "backbone.min",
		"backbone-relational": "backbone-relational",
		underscore: "underscore.min",
		helper: "helper",
		bootstrap: "bootstrap.min",
		localstorage: "backbone.localStorage.min",
		appglobal: "../app/app",
		user: "../backbone/user",
		movie: "../backbone/movie",
		toy: "../backbone/toy",
		country: "../backbone/country"
	},
	shim: {
		jquery: {
			exports: "jQuery"
		},
		underscore: {
			exports: "_"
		},
		backbone: {
			deps: ["jquery", "underscore"],
			exports: "Backbone"
		},
		"backbone-relational": {
			deps: ["backbone"]
		},
		appglobal: ["cs!helper", "cs!user", "cs!movie", "cs!toy", "cs!country"],
		bootstrap: ["jquery"],
		localstorage: {
			deps: ["backbone"]
		},
		user: {
			deps: ["backbone"]
		},
		movie: {
			deps: ["backbone"]
		},
		toy: {
			deps: ["backbone"]
		},
		country: {
			deps: ["backbone"]
		}
	}
});


requirejs(["cs!appglobal"]);