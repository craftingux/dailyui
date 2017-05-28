
# Notes

# Shared: https://twitter.com/craftingUX/status/842059176264269824
# Colors: https://coolors.co/fe6d64-f1bc8a-d9d5b8-ccf0d3-eff5de

# Settings

SPRING_STANDARD = Spring(tension: 250, friction: 20, velocity: 1)
# SPRING_STANDARD = Spring(tension: 1000, friction: 50, velocity: 30)


# Background

bg = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "#41433C"


# Field

field = new Layer
	y: Screen.height / 2 - 50
	borderRadius: 50
	animationOptions: 
		curve: SPRING_STANDARD

field.states.default =
	width: 100
	height: 100
	backgroundColor: "#CCF0D3"
	x: Screen.width / 2 - 50

field.states.active =
	width: 400
	height: 100
	backgroundColor: "#EFF5DE"
	x: Screen.width / 2 - 200

field.stateSwitch("default")


# Search Icon

searchIcon = new Layer
	superLayer: field
	width: 60
	height: 60
	y: Align.center
	backgroundColor: 'transparent'
	animationOptions: 
		curve: SPRING_STANDARD

searchIcon.states.default =
	x: field.width / 2 - 30

searchIcon.states.active =
	x: 310

searchIcon.stateSwitch("default")

searchIconCircle = new Layer
	superLayer: searchIcon
	backgroundColor: 'transparent'
	borderRadius: 25
	borderWidth: 3
	animationOptions: 
		curve: SPRING_STANDARD

searchIconCircle.states.default =
	width: 50
	height: 50
	borderColor: "#41433C"
	scale: 1
	opacity: 1

searchIconCircle.states.active =
	width: 50
	height: 50
	borderColor: "#41433C"
	scale: 0
	opacity: 0

searchIconCircle.stateSwitch("default")

searchIconLine1 = new Layer
	superLayer: searchIcon
	width: 3
	height: 20
	backgroundColor: "#41433C"
	borderRadius: 3
	x: 42
	y: 42
	animationOptions: 
		curve: SPRING_STANDARD

searchIconLine1.states.default =
	height: 20
	y: 42
	originX: 0
	originY: 0
	rotation: -45

searchIconLine1.states.active =
	height: 60
	y: 0
	originX: 0.5
	originY: 0.5
	rotation: 225

searchIconLine1.stateSwitch("default")

searchIconLine2 = new Layer
	superLayer: searchIcon
	width: 3
	height: 20
	backgroundColor: "#41433C"
	borderRadius: 3
	x: 42
	y: 42
	animationOptions: 
		curve: SPRING_STANDARD
	originX: 0
	originY: 0
	rotation: -45

searchIconLine2.states.default =
	height: 20
	y: 42
	originX: 0
	originY: 0
	rotation: -45
	opacity: 0

searchIconLine2.states.active =
	height: 60
	y: 0
	originX: 0.5
	originY: 0.5
	rotation: 315
	opacity: 1

searchIconLine2.stateSwitch("default")

# Search Text

searchText = new Layer
	superLayer: field
	html: "SEARCH"
	height: 32
	width: 140
	x: 24
	y: 36
	backgroundColor: 'transparent'
	color: "rgba(65,67,60,0.3)"
	style: 
		fontSize: "32px"
	animationOptions: 
		curve: SPRING_STANDARD

searchText.states.default =
	opacity: 0

searchText.states.active =
	opacity: 1

searchText.stateSwitch("default")


# Events

field.on Events.Tap, ->
	field.stateCycle()
	searchIcon.stateCycle()
	searchIconCircle.stateCycle()
	searchIconLine1.stateCycle()
	searchIconLine2.stateCycle()
	searchText.stateCycle()

