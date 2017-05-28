
# Settings & Globals

BORDER_RADIUS_INPUT_STANDARD = 12

COLOR_BG_DEFAULT = "rgba(240,240,250,1)"
COLOR_INPUT_STANDARD = "rgba(255,255,255,1)"

SIZE_INPUT_STANDARD_HEIGHT = 132
SIZE_INPUT_STANDARD_WIDTH = Screen.width * 0.8


# Scene

bg = new Layer
	backgroundColor: COLOR_BG_DEFAULT
	width: Screen.width
	height: Screen.height


# Blades

blade1 = new Layer
	backgroundColor: "#232325"
	borderRadius: BORDER_RADIUS_INPUT_STANDARD
	animationOptions: 
		curve: Spring(tension: 250, friction: 25, velocity: 0)
blade1.states.default =
	height: 2880
	x: 70
	y: -698
	width: 1600
	rotation: -40
blade1.states.active =
	x: -365
	y: 503
	width: 1713
	height: 1995
	rotation: 101
blade1.stateSwitch("default")


blade2 = new Layer
	backgroundColor: "#2C4249"
	borderRadius: BORDER_RADIUS_INPUT_STANDARD
	opacity: 0.8
	animationOptions: 
		curve: Spring(tension: 250, friction: 25, velocity: 0)
blade2.states.default =
	height: 2880
	x: -704
	y: -577
	width: 1600
	rotation: 40
blade2.states.active =
	y: 542
	x: -328
	width: 1713
	height: 1995
	rotation: -101
blade2.stateSwitch("default")


# Logo

logo_box = new Layer
	width: 300
	height: 300
	x: Align.center
	rotation: 45
	borderRadius: 9
	backgroundColor: "rgba(165,143,123,1)"
logo_box.states.default =
	opacity: 0
	scale: 0
	y: 100
	animationOptions: 
		curve: Spring(tension: 250, friction: 50, velocity: 10)
logo_box.states.active =
	opacity: 1
	scale: 1
	y: 130
	animationOptions: 
		curve: Spring(tension: 200, friction: 75, velocity: 50)
logo_box.stateSwitch("default")

tinydog_white = new Layer
	height: 245
	image: "images/tinydog-white.png"
	width: 178
	y: 164
	x: 532
	animationOptions: 
		curve: Spring(tension: 200, friction: 75, velocity: 50)
tinydog_white.states.default =
	scale: 1
tinydog_white.states.active =
	scale: 0.8
tinydog_white.stateSwitch("default")

# Input

inputContainer = new Layer
	backgroundColor: "transparent"
	width: SIZE_INPUT_STANDARD_WIDTH
	height: 1124
	x: Align.center
	y: Align.center
	animationOptions: 
		curve: Spring(tension: 250, friction: 25, velocity: 0)
inputContainer.states.default =
	opacity: 1
	scale: 1
inputContainer.states.active =
	opacity: 0
	scale: 0
inputContainer.stateSwitch("default")

inputName = new Layer
	parent: inputContainer
	backgroundColor: COLOR_INPUT_STANDARD
	width: SIZE_INPUT_STANDARD_WIDTH
	height: SIZE_INPUT_STANDARD_HEIGHT
	borderRadius: BORDER_RADIUS_INPUT_STANDARD

inputNameValue = new TextLayer
	parent: inputName
	text: "Joshua Hamilton"
	fontSize: 60
	x: 40
	y: 30

inputEmail = new Layer
	parent: inputContainer
	backgroundColor: COLOR_INPUT_STANDARD
	width: SIZE_INPUT_STANDARD_WIDTH
	height: SIZE_INPUT_STANDARD_HEIGHT
	borderRadius: BORDER_RADIUS_INPUT_STANDARD
	y: SIZE_INPUT_STANDARD_HEIGHT + 30

inputEmailValue = new TextLayer
	parent: inputEmail
	text: "joshua@craftingux.com"
	fontSize: 60
	x: 40
	y: 30

inputMessage = new Layer
	parent: inputContainer
	backgroundColor: COLOR_INPUT_STANDARD
	width: SIZE_INPUT_STANDARD_WIDTH
	height: 800
	borderRadius: BORDER_RADIUS_INPUT_STANDARD
	y: (SIZE_INPUT_STANDARD_HEIGHT * 2) + 60

inputMessageValue = new TextLayer
	parent: inputMessage
	text: "Contact me ASAP"
	fontSize: 60
	x: 40
	y: 30


# Button

button = new Layer
	backgroundColor: "#A58F7B"
	width: SIZE_INPUT_STANDARD_WIDTH
	height: 200
	x: Align.center
	y: inputContainer.y + inputContainer.height + 30
	borderRadius: BORDER_RADIUS_INPUT_STANDARD
	animationOptions: 
		curve: Spring(tension: 250, friction: 25, velocity: 0)
button.states.default =
	opacity: 1
	scale: 1
button.states.active =
	opacity: 0
	scale: 0
button.stateSwitch("default")

buttonText = new TextLayer
	parent: button
	text: "Submit"
	fontSize: 100
	color: "#FFFFFF"
	x: Align.center
	y: Align.center


# Message

message = new TextLayer
	text: "Thank you for taking the time to contact us. You will hear from us soon.."
	width: SIZE_INPUT_STANDARD_WIDTH
	fontSize: 90
	color: "#F0F0FA"
	fontWeight: 700
message.states.default =
	y: 1000
	x: 10
	opacity: 0
	animationOptions: 
		curve: Spring(tension: 250, friction: 50, velocity: 100)
message.states.active =
	y: 1030
	x: 124
	opacity: 1
	animationOptions: 
		curve: Spring(tension: 200, friction: 75, velocity: 50)
message.stateSwitch("default")

# Back Text

back = new TextLayer
	text: "Return to Contact Form"
	width: SIZE_INPUT_STANDARD_WIDTH
	fontSize: 80
	color: "#A58F7B"
	fontWeight: 400
	opacity: 0
back.states.default =
	y: 1550
	x: 10
	opacity: 0
	animationOptions: 
		curve: Spring(tension: 250, friction: 50, velocity: 100)
back.states.active =
	y: 1580
	x: 124
	opacity: 1
	animationOptions: 
		delay: 0.2
		curve: Spring(tension: 200, friction: 75, velocity: 50)
back.stateSwitch("default")

# Events

cycleStates = ->
	inputContainer.stateCycle()
	button.stateCycle()
	blade1.stateCycle()
	blade2.stateCycle()
	logo_box.stateCycle()
	tinydog_white.stateCycle()
	message.stateCycle()
	back.stateCycle()

button.on Events.Click, ->
	cycleStates()

back.on Events.Click, ->
	cycleStates()

