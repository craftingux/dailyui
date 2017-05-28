
# Scene

bg = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: '#f5f5f7'


# Button

button = new Layer
	backgroundColor: 'transparent'
	width: 600
	height: 600
	y: Align.center
	x: Align.center
	rotationZ: 225
	animationOptions: 
		curve: Spring(tension: 500, friction: 100, velocity: 50)
button.states.default =
	rotationZ: 225
	y: Align.center
button.states.active =
	rotationZ: 0
	y: 21
button.stateSwitch("default")

createButtonPart = (backgroundColor, startWidth, startHeight, startX, startY, originX, originY, rotateActiveZ, startBorderRadius) ->
	part = new Layer
		parent: button
		backgroundColor: backgroundColor
		width: startWidth
		height: startHeight
		x: startX
		y: startY
		originX: originX
		originY: originY
		rotationZ: 0
		animationOptions: 
			curve: Spring(tension: 500, friction: 100, velocity: 50)
	part.states.default =
		rotationZ: 0
	part.states.active = 
		rotationZ: rotateActiveZ
	part.stateSwitch("default")
	part

partWidthStart = button.width / 2
partHeightStart = button.height / 2

buttonPart1 = createButtonPart('#2C4249', partWidthStart, partHeightStart, 0, 0, 0, 1, 0, '0')

buttonPart2 = createButtonPart('#517080', partWidthStart, partHeightStart, 300, 0, 1, 1, 0, '0')

buttonPart3 = createButtonPart('#232325', partWidthStart, partHeightStart, 0, 300, 0, 0, 180, '0 30px 0 0')

buttonPart4 = createButtonPart('#BCBEBE', partWidthStart, partHeightStart, 300, 300, 1, 0, -180, '30px 0 0 0')


# Dropdown

dropdown = new Layer
	backgroundColor: '#DED9C6'
	width: 10
	height: 10
	y: (Screen.height / 2) - 5
	x: (Screen.width / 2) - 5
dropdown.states.default =
	width: 10
	height: 10
	y: (Screen.height / 2) - 5
	x: (Screen.width / 2) - 5
	animationOptions: 
		delay: 0
		curve: Spring(tension: 1000, friction: 100, velocity: 50)
dropdown.states.active =
	width: 1200
	height: Screen.height - 358
	y: 342
	x: Screen.width / 2 - 600
	animationOptions: 
		delay: 0.2
		curve: Spring(tension: 1000, friction: 100, velocity: 50)
dropdown.stateSwitch("default")


# Events

button.bringToFront()

button.on Events.Click, ->
	button.stateCycle()
	buttonPart3.stateCycle()
	buttonPart4.stateCycle()
	dropdown.stateCycle()

