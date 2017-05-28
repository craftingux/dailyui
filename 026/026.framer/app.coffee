
# Settings

BORDER_RADIUS_MESSAGE_BOX = 30
BORDER_RADIUS_SMALL = 10

COLOR_MASK = "rgba(100,100,255,1)"

SPRING_STANDARD = Spring(tension: 280, friction: 25, velocity: 15)

STYLE_MESSAGE_FONT_SIZE = '90px'
STYLE_MESSAGE_LINE_HEIGHT = '130px'
STYLE_MESSAGE_PADDING = '60px'

WIDTH_MAX = Screen.width * 0.9


# Stage

bg = new Layer
	width: Screen.width
	height: Screen.height

bg.states.default =
	backgroundColor: "rgba(250,250,255,1)"
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 0

bg.states.active =
	backgroundColor: COLOR_MASK
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 1

bg.stateCycle("default")


# Sign Up Form

input = new Layer
	width: WIDTH_MAX
	height: 180
	x: Align.center
	y: Align.center
	opacity: 1
	borderRadius: BORDER_RADIUS_SMALL

input.states.default =
	opacity: 1
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 1

input.states.active =
	opacity: 0
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 0

input.stateSwitch("default")

message = new Layer
	width: WIDTH_MAX
	height: 600
	borderRadius: BORDER_RADIUS_MESSAGE_BOX
	x: Align.center
	y: input.y - (700)
	opacity: 1
	html: "Sign up for Special Deals & Updates"
	style: 
		fontSize: STYLE_MESSAGE_FONT_SIZE
		lineHeight: STYLE_MESSAGE_LINE_HEIGHT
		padding: STYLE_MESSAGE_PADDING
		textAlign: "center"

message.states.default =
	opacity: 1
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 1

message.states.active =
	opacity: 0
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 0

message.stateSwitch("default")


# Subscribe Button

button = new Layer
	width: Screen.width
	height: 220
	y: Screen.height - 220
	backgroundColor: "rgba(234,100,121,1)"
	html: "Subscribe"
	style: 
		fontSize: "100px"
		paddingTop: "100px"
		textAlign: "center"

button.states.default =
	y: Screen.height - 220
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 1

button.states.active =
	y: Screen.height + 220
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 0

button.stateSwitch("default")


# Bubbles

bubbles = []

for i in [1..24]
	min = 400
	max = 800
	activeSize = Utils.randomNumber min, max
	x = Utils.randomNumber -(min), Screen.width - min
	y = Utils.randomNumber -(min), Screen.height - min

	bubble = new Layer
		size: activeSize
		x: (Screen.width / 2) - (activeSize / 2)
		y: (Screen.height / 2) - (activeSize / 2)
		backgroundColor: COLOR_MASK
		borderRadius: activeSize / 2
		opacity: 0
		scale: 0
		animationOptions: 
			curve: SPRING_STANDARD
			delay: i * 0.01

	bubble.states.default = 
		x: (Screen.width / 2) - (activeSize / 2)
		y: (Screen.height / 2) - (activeSize / 2)
		scale: 0
		opacity: 0

	bubble.states.active = 
		x: x
		y: y
		scale: 1
		opacity: 1

	bubble.stateSwitch("default")

	bubbles.push bubble


# Thank You Message

message2 = new Layer
	width: WIDTH_MAX
	height: 910
	x: Align.center
	borderRadius: BORDER_RADIUS_MESSAGE_BOX
	backgroundColor: "rgba(255,255,255,0.5)"
	html: "Thank you for subscribing. Be sure to check your email for instructions to complete your subscription."
	style: 
		fontSize: STYLE_MESSAGE_FONT_SIZE
		lineHeight: STYLE_MESSAGE_LINE_HEIGHT
		padding: STYLE_MESSAGE_PADDING
		textAlign: "center"
	animationOptions: 
		curve: SPRING_STANDARD

message2.states.default =
	y: -(910)

message2.states.active =
	y: input.y - (700)

message2.stateSwitch("default")


# Close Button

close = new Layer
	width: WIDTH_MAX
	height: 220
	x: (Screen.width / 2) - (WIDTH_MAX / 2)
	y: Screen.height / 2
	borderRadius: BORDER_RADIUS_SMALL
	backgroundColor: "rgba(66,171,97,1)"
	scale: 0
	opacity: 0
	html: "Close"
	style: 
		fontSize: "100px"
		paddingTop: "100px"
		textAlign: "center"

close.states.default =
	x: (Screen.width / 2) - (WIDTH_MAX / 2)
	y: Screen.height / 2
	scale: 0
	opacity: 0
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 0.2

close.states.active =
	y: 1300
	scale: 1
	opacity: 1
	animationOptions: 
		curve: SPRING_STANDARD
		delay: 0

close.stateSwitch("default")

# Events

cycleStates = ->
	button.stateCycle()
	for bubble, index in bubbles
		bubble.stateCycle()
		if index == (bubbles.length / 2)
			bg.stateCycle()
			message2.stateCycle()
			close.stateCycle()
			input.stateCycle()
			message.stateCycle()

button.on Events.Click, ->
	cycleStates()

close.on Events.Click, ->
	cycleStates()

