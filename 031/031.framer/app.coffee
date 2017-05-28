# Globals

ANIMATING = false


# Scene

bg = new Layer
	backgroundColor: '#f5f5f9'
	width: Screen.width
	height: Screen.height

# Upload Container

uploadContainer = new Layer
	backgroundColor: "rgba(193,219,242,1)"
	width: 400
	height: 300
	x: Screen.width / 2 - 200
	y: 50
	borderRadius: 5
	borderColor: "rgba(178,203,225,1)"
	clip: true

uploadContainerCollapseAnimationPart1 = new Animation uploadContainer,
	height: 10
	width: 10
	x: Screen.width / 2 - 5
	y: 170
	options:
		time: 0.06
		curve: Bezier.easeInOut

uploadContainerCollapseAnimationPart2 = new Animation uploadContainer,
	height: 10
	width: 400
	x: Screen.width / 2 - 200
	y: 195
	options:
		time: 0.2
		curve: Bezier.easeInOut

uploadContainerToCircleAnimation = new Animation uploadContainer,
	width: 100
	height: 100
	x: Screen.width / 2 - 50
	y: 150
	borderRadius: 50
	backgroundColor: "rgba(88,201,138,1)"
	options:
		delay: 0.25
		time: 0.4
		curve: Bezier.easeInOut

# Text: Instructions

textUpload = new TextLayer
	parent: uploadContainer
	text: "Click to Simulate Upload"
	fontSize: 32
	fontWeight: 300
	color: "rgba(255,255,255,1)"
	width: 220
	textAlign: 'center'
	x: Align.center
	y: 96

textUploadCollapseAnimation = new Animation textUpload,
	scale: 0
	opacity: 0
	x: 5
	y: 5
	options:
		time: 0.2
		curve: Bezier.easeInOut

# Progress Indicator

progressIndicator = new Layer
	parent: uploadContainer
	height: 300
	width: 0
	backgroundColor: "rgba(32,179,212,1)"

progressIndicatorUploadingAnimation = new Animation progressIndicator,
	width: 400
	options:
		time: 3

progressIndicatorCollapseAnimation = new Animation progressIndicator,
	height: 0
	opacity: 0
	options:
		delay: 0.2
		time: 0.5
		curve: Bezier.easeInOut

# Checkbox

checkboxContainer = new Layer
	parent: uploadContainer
	backgroundColor: 'transparent'
	rotation: -45
	width: 80
	height: 60
	x: 20
	y: 16

checkboxPart1 = new Layer
	parent: checkboxContainer
	backgroundColor: '#ffffff'
	width: 6
	height: 0
	borderRadius: 3
	x: 10
	y: 10

checkboxPart2 = new Layer
	parent: checkboxContainer
	backgroundColor: '#ffffff'
	width: 0
	height: 6
	borderRadius: 3
	x: 10
	y: 30

checkboxPart1ExpandAnimation = new Animation checkboxPart1,
	height: 25
	options:
		delay: 0.2
		time: 0.15
		curve: Bezier.easeIn

checkboxPart2ExpandAnimation = new Animation checkboxPart2,
	width: 50
	options:
		time: 0.3
		curve: Bezier.easeOut

# Text: Upload Complete

textUploadComplete = new TextLayer
	text: "Upload Complete"
	color: "rgba(106,124,142,1)"
	fontSize: 16
	fontWeight: 500
	x: Align.center
	y: 250
	scale: 0
	opacity: 0

textUploadCompleteExpandAnimation = new Animation textUploadComplete,
	y: 275
	scale: 1
	opacity: 1
	options:
		time: 0.3
		curve: Bezier.easeInOut

# Text: Reload Message

textReloadMessage = new TextLayer
	text: "Reload to Reset"
	color: "rgba(106,124,142,1)"
	fontSize: 11
	fontWeight: 500
	opacity: 0
	scale: 0
	x: Align.center
	y: 290

textReloadMessageDisplayAnimation = new Animation textReloadMessage,
	opacity: 0.3
	scale: 1
	y: 310
	options:
		delay: 0.3
		time: 0.3
		curve: Bezier.easeInOut

# Events

uploadContainer.on Events.Click, ->
	if !ANIMATING
		ANIMATING = true
		textUploadCollapseAnimation.start()
		uploadContainerCollapseAnimationPart1.start()

uploadContainerCollapseAnimationPart1.onAnimationEnd ->
	uploadContainerCollapseAnimationPart2.start()

uploadContainerCollapseAnimationPart2.onAnimationEnd ->
	progressIndicatorUploadingAnimation.start()

progressIndicatorUploadingAnimation.onAnimationEnd ->
	uploadContainerToCircleAnimation.start()
	progressIndicatorCollapseAnimation.start()

progressIndicatorCollapseAnimation.onAnimationEnd ->
	checkboxPart1ExpandAnimation.start()

checkboxPart1ExpandAnimation.onAnimationEnd ->
	checkboxPart2ExpandAnimation.start()
	textUploadCompleteExpandAnimation.start()
	textReloadMessageDisplayAnimation.start()

