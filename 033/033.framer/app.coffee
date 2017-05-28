
# Settings & Globals

RADIUS_MIN = 0
RADIUS_MAX = 200
ITEMS_TOTAL = 8
SLICE_SIZE = 2 * Math.PI / ITEMS_TOTAL
CENTER_X = Screen.width / 2
CENTER_Y = Screen.height / 2

shirtHueShiftValues = [0, 45, 90, 135, 180, 225, 270, 315]

optionsColor = []

# Scene



# Shirt Container

shirtContainer = new Layer
	width: 360
	height: 360
	borderRadius: 180
	x: Align.center
	y: 100

shirtContainerBackground = new Layer
	parent: shirtContainer
	width: 360
	height: 360
	opacity: 0
	borderRadius: 180

shirtContainerMatch = (option) ->
	shirtContainerBackground.animate
		opacity: 0.15
		backgroundColor: option.backgroundColor
		saturate: 255
		options: 
			curve: Spring(tension: 250, friction: 25, velocity: 25)

# Shirt 1

# shirtColorValues = ['#FCEB45', '#85FF61', '#46FFCC', '#62FFFF', '#CADBFF', '#FFBAFF', '#FFB2FD', '#FFC786']

# shirt = new Layer
# 	width: 250
# 	height: 250
# 	image: "images/shirt.png"


# Shirt 2 (In Use)

shirt2ColorValues = ['#6C939C', '#7E85A9', '#947CA2', '#AA7C94', '#A58279', '#918864', '#7A946E', '#68937F']

shirt2 = new Layer
	parent: shirtContainer
	height: 245
	image: "images/shirt2.png"
	width: 209
	hueRotate: 0
	x: 72
	y: Align.center

shirt2.saturate = 255

# Options - Color

optionsContainer = new Layer
	backgroundColor: 'transparent'
	width: 400
	height: 400
	x: Align.center
	y: 80

createOption = (x, y) ->
	option = new Layer
		parent: optionsContainer
		backgroundColor: value
		width: 50
		height: 50
		y: x
		x: y
		borderRadius: 25
		saturate: 255
		
	option.clickIndex = index
		
	option.on Events.Click, (event, sender) ->
		shirtContainerMatch(sender)
		shirt2.animate
			saturate: 255
			hueRotate: shirtHueShiftValues[@clickIndex]
			options: 
				curve: Spring(tension: 250, friction: 25, velocity: 25)

	option

# Render

for value, index in shirt2ColorValues
	angle = SLICE_SIZE * index
	x = (optionsContainer.width / 2) - 25 + RADIUS_MAX * Math.cos(angle)
	y = (optionsContainer.height / 2) - 25 + RADIUS_MAX * Math.sin(angle)
	optionsColor.push createOption(x, y)

shirtContainerBackground.animate
	opacity: 0.15
	backgroundColor: optionsColor[0].backgroundColor
	saturate: 255

# Events
