bg = new Layer
	width: Screen.width
	height: Screen.height
	animationOptions:
		curve: Bezier.easeInOut
		time: 0.222
bg.states.default =
	backgroundColor: '#f5f5f9'
bg.states.active =
	backgroundColor: '#DF444E'
bg.stateSwitch('default')

switchBackground = new Layer
	borderRadius: 47
	height: 94
	width: 200
	x: Screen.width / 2 - 100
	y: Screen.height / 2 - 47
	animationOptions:
		curve: Bezier.easeInOut
		time: 0.222
switchBackground.states.default =
	backgroundColor: 'rgba(0, 200, 225, 0.6)'
switchBackground.states.active =
	backgroundColor: 'rgba(255, 255, 255, 1.0)'
switchBackground.stateSwitch('default')

switchButton = new Layer
	superLayer: switchBackground
	animationOptions:
		curve: Bezier.easeInOut
		time: 0.222
switchButton.states.default =
	backgroundColor: '#ffffff'
	borderRadius: 40
	height: 80
	width: 80
	x: 7
	y: 7
switchButton.states.active =
	backgroundColor: '#DF444E'
	borderRadius: 40
	height: 80
	width: 80
	x: switchBackground.width - 87
	y: 7
switchButton.stateSwitch('default')

switchBackground.on Events.Tap, ->
	switchButton.stateCycle()
	switchBackground.stateCycle()
	bg.stateCycle()