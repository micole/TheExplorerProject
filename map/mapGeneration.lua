require("map/mapTypes")

mapGeneration = {}

mapGeneration['linearTunnel'] = require("map/generation/base/linearTunnel")
mapGeneration['nonLinearTunnel'] = require("map/generation/base/nonLinearTunnel")
mapGeneration['linearCave'] = require("map/generation/base/linearCave")
mapGeneration['nonLinearCave'] = require("map/generation/base/nonLinearCave")
mapGeneration['outlineWall'] = require("map/generation/modify/outlineWall")

function mapGeneration.testGeneration()
	local map1 = map:new()
	map1:buildMap(60,60)
	io.output("./mapoutput.grid", "w")

	linearCave.generate(map1,2,400)

	map1:printMap(" ")

	io.close()
end

function mapGeneration.runGenerate(script, map, seed, decay)
	mapGeneration[script].generate(map,seed,decay)
end

function mapGeneration.runScript(script, map)
	mapGeneration[script].run(map)
end

function mapGeneration.configure(script, parameter, value)
	mapGeneration[script][parameter] = value
end

function mapGeneration.getParameter(script, paramter)
	return mapGeneration[script][parameter]
end