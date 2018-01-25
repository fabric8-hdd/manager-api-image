var server   = require("../main"),
	chai     = require("chai"),
	chaiHTTP = require("chai-http"),
	should   = chai.should()

chai.use(chaiHTTP)

describe("Test manager api", function() {

	describe("GET to /manager/api/v1.0/experiments/22f82a83-7b1b-4556-aeea-5b3b16a9b287", () => {
		it(" should return 200", function(done){
			chai.request(server)
				.get("/manager/api/v1.0/experiments/22f82a83-7b1b-4556-aeea-5b3b16a9b287")
				.end(function(err, res) {
					res.should.have.status(200)
					done()
				})
		})
	})


	describe("GET to /manager/api/v1.0/experiments/xxxx", () => {
		it("should return 400", function(done){
			chai.request(server)
				.get("/manager/api/v1.0/experiments/xxxx")
				.end(function(err, res) {
					res.should.have.status(400)
					done()
				})
		})
	})

})

describe("Test readiness and liveness api",function(){

	describe("Get to /manager/api/v1.0/readiness", () => {
		it(" should return 200", function(done){
			chai.request(server)
				.get("/manager/api/v1.0/readiness")
				.end(function(err, res) {
					res.should.have.status(200)
					done()
				})
		})
	})

	describe("Get to /manager/api/v1.0/liveness", () => {
		it(" should return 200", function(done){
			chai.request(server)
				.get("/manager/api/v1.0/liveness")
				.end(function(err, res) {
					res.should.have.status(200)
					done()
				})
		})
	})
})

