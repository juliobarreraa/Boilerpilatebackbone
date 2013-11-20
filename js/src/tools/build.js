{
	appDir: "../js",
	baseUrl: "vendor",
	dir: "../../production",
	mainConfigFile: "../js/app.js",
	//Stub out the cs module after a build since
    //it will not be needed.
    stubModules: ['cs'],
    //"optimize": "uglify",
    "optimize": "none",
	modules: [
		{
			"name": "app",
			exclude: ['coffee-script']
		}
	]
}