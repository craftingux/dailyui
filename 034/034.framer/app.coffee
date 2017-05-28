
# Globals & Settings

customFont = Utils.loadWebFont("Orbitron")

currentSpeed = 0
currentSpeedRotation = 0

thresholds = [
	{ limit: 0, color: 'black' },
	{ limit: 1, color: 'green' },
	{ limit: 65, color: 'green' },
	{ limit: 66, color: 'orange' },
	{ limit: 72, color: 'orange' },
	{ limit: 80, color: 'red' }
]

# Scene

bg = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: thresholds[0].color

speedContainer = new Layer
	backgroundColor: 'transparent'
	width: 400
	height: 230
	x: Align.center
	y: 40
	clip: true

# Text Indicator

textContainer = new Layer
	parent: speedContainer
	backgroundColor: 'transparent'
	height: 120
	width: 120
	x: 40
	y: 114

currentSpeedText = new TextLayer
	parent: textContainer
	text: currentSpeed
	fontFamily: customFont
	fontSize: 50
	color: 'white'

ofText = new TextLayer
	parent: textContainer
	text: "of"
	fontFamily: customFont
	fontSize: 14
	y: currentSpeedText.height
	color: 'white'

speedLimitText = new TextLayer
	parent: textContainer
	text: "65"
	fontFamily: customFont
	fontSize: 30
	y: ofText.y - 10
	x: ofText.width + 10
	color: 'white'

# Bubble

speedBubble = new Layer
	parent: speedContainer
	backgroundColor: 'rgba(255, 255, 255, 0.2)'
	width: 400
	height: 400
	borderRadius: 200

speedBar = new Layer
	parent: speedBubble
	width: 200
	height: 10
	backgroundColor: 'rgba(255, 255, 255, 0.7)'
	borderRadius: 5
	y: 220
	originX: 1.00
	opacity: 0.5
	rotation: currentSpeedRotation

speedBarPivot = new Layer
	parent: speedBubble
	backgroundColor: 'white'
	width: 40
	height: 40
	borderRadius: 20
	x: Align.center
	y: 205

speedBarStopper = new Layer
	parent: speedBubble
	backgroundColor: 'white'
	width: 10
	height: 10
	borderRadius: 5
	x: 330
	y: 154

# Functions

updateUI = ->
	speedBar.rotation = currentSpeedRotation
	for threshold in thresholds
		currentSpeedText.text = currentSpeed
		if currentSpeed >= threshold.limit
			bg.animate
				backgroundColor: threshold.color


# Controls

slider = new SliderComponent
	x: Align.center
	y: 360

sliderText = new TextLayer
	x: Align.center
	y: 380
	fontSize: 12
	text: 'Slide to simulate acceleration.'
	color: 'rgba(255, 255, 255, 0.7)'


# Events

slider.on Events.SliderValueChange, ->
	currentSpeed = parseInt Utils.modulate(slider.value, [0, 1], [0, 100]), 10
	currentSpeedRotation = parseInt Utils.modulate(slider.value, [0, 1], [0, 150]), 10
	updateUI()
