sketch = Framer.Importer.load("imported/010@3x")


# ===================================

blurBackground = new Layer
	animationOptions:
		curve: Spring(damping: 0)
blurBackground.states.default = 
	backgroundColor: 'rgba(2, 1, 1, 0)'
	borderRadius: 100
	x: Screen.size.width - 200
	y: Screen.size.height - 180
	width: 100
	height: 100
blurBackground.states.active = 
	backgroundColor: 'rgba(2, 1, 1, 0.8)'
	borderRadius: 2000
	x: - 800
	y: - 800
	width: 4000
	height: 4000
blurBackground.stateSwitch('default')


# ===================================

buttonShare = new Layer
	borderRadius: 80
	shadowX: 0
	shadowY: 8
	shadowBlur: 12
	shadowSpread: -4
	shadowColor: 'rgba(21, 122, 251, 0.4)'
	animationOptions:
		curve: Spring(damping: 1.5)
buttonShare.states.default = 
	backgroundColor: 'rgba(21, 122, 251, 1.00)'
	rotationZ: 0
	x: Screen.size.width - 220
	y: Screen.size.height - 220
	width: 160
	height: 160
buttonShare.states.active = 
	backgroundColor: 'rgba(255, 255, 255, 1.0)'
	rotationZ: 0
	x: Screen.size.width - 220
	y: Screen.size.height - 220
	width: 160
	height: 160
buttonShare.stateSwitch('default')

buttonShareCircleTop = new Layer
	superLayer: buttonShare
	animationOptions:
		curve: Spring(damping: 0.5)
buttonShareCircleTop.states.default = 
	backgroundColor: 'rgba(255, 255, 255, 1.0)'
	borderRadius: 15
	opacity: 1.0
	x: 40
	y: 24
	width: 30
	height: 30
buttonShareCircleTop.states.active = 
	backgroundColor: 'rgba(100, 0, 0, 1.0)'
	borderRadius: 15
	opacity: 0.0
	x: 110
	y: 70
	width: 0
	height: 0
buttonShareCircleTop.stateSwitch('default')

buttonShareCircleBottom = new Layer
	superLayer: buttonShare
	animationOptions:
		curve: Spring(damping: 0.5)
buttonShareCircleBottom.states.default = 
	backgroundColor: 'rgba(255, 255, 255, 1.0)'
	borderRadius: 15
	opacity: 1.0
	x: 40
	y: 104
	width: 30
	height: 30
buttonShareCircleBottom.states.active = 
	backgroundColor: 'rgba(100, 0, 0, 1.0)'
	borderRadius: 15
	opacity: 0.0
	x: 110
	y: 110
	width: 0
	height: 0
buttonShareCircleBottom.stateSwitch('default')

buttonShareBarTop = new Layer
	superLayer: buttonShare
	animationOptions:
		curve: Spring(damping: 0.5)
buttonShareBarTop.states.default = 
	backgroundColor: 'rgba(255, 255, 255, 1.0)'
	borderRadius: 15
	rotationZ: 30
	x: 50
	y:50
	width: 80
	height: 16
buttonShareBarTop.states.active = 
	backgroundColor: 'rgba(200, 0, 0, 1.0)'
	borderRadius: 15
	rotationZ: 45
	x: 40
	y: 70
	width: 80
	height: 16
buttonShareBarTop.stateSwitch('default')

buttonShareBarBottom = new Layer
	superLayer: buttonShare
	animationOptions:
		curve: Spring(damping: 0.5)
buttonShareBarBottom.states.default = 
	backgroundColor: 'rgba(255, 255, 255, 1.0)'
	borderRadius: 15
	rotationZ: -30
	x: 50
	y: 90
	width: 80
	height: 16
buttonShareBarBottom.states.active = 
	backgroundColor: 'rgba(200, 0, 0, 1.0)'
	borderRadius: 15
	rotationZ: -45
	x: 40
	y: 70
	width: 80
	height: 16
buttonShareBarBottom.stateSwitch('default')


# ===================================

buttonFacebook = new Layer
	borderRadius: 40
	borderColor: 'rgba(255, 255, 255, 1.0)'
	borderWidth: 4
	animationOptions:
		curve: Spring(damping: 0.5)
		delay: 0.1
buttonFacebook.states.default = 
	backgroundColor: 'rgba(200, 0, 0, 0.0)'
	width: 80
	height: 80
	opacity: 0.0
	rotationZ: 45
	x: buttonShare.x + 40
	y: buttonShare.y + 40
buttonFacebook.states.active = 
	backgroundColor: 'rgba(200, 0, 0, 1.0)'
	width: 80
	height: 80
	opacity: 1.0
	rotationZ: 0
	x: buttonShare.x - 180
	y: buttonShare.y + 40
buttonFacebook.stateSwitch('default')

buttonTwitter = new Layer
	borderRadius: 40
	borderColor: 'rgba(255, 255, 255, 1.0)'
	borderWidth: 4
	animationOptions:
		curve: Spring(damping: 0.5)
		delay: 0.2
buttonTwitter.states.default = 
	backgroundColor: 'rgba(200, 0, 0, 0.0)'
	width: 80
	height: 80
	opacity: 0.0
	rotationZ: 45
	x: buttonShare.x + 40
	y: buttonShare.y + 40
buttonTwitter.states.active = 
	backgroundColor: 'rgba(200, 0, 0, 1.0)'
	width: 80
	height: 80
	opacity: 1.0
	rotationZ: 0
	x: buttonShare.x + 40
	y: buttonShare.y - 200
buttonTwitter.stateSwitch('default')

buttonInstagram = new Layer
	borderRadius: 40
	borderColor: 'rgba(255, 255, 255, 1.0)'
	borderWidth: 4
	animationOptions:
		curve: Spring(damping: 0.5)
		delay: 0.15
buttonInstagram.states.default = 
	backgroundColor: 'rgba(200, 0, 0, 0.0)'
	width: 80
	height: 80
	opacity: 0.0
	rotationZ: 45
	x: buttonShare.x + 40
	y: buttonShare.y + 40
buttonInstagram.states.active = 
	backgroundColor: 'rgba(200, 0, 0, 1.0)'
	width: 80
	height: 80
	opacity: 1.0
	rotationZ: 0
	x: buttonShare.x - 85
	y: buttonShare.y - 100
buttonInstagram.stateSwitch('default')


# ===================================

buttonShare.on Events.Tap, ->
	buttonShareCircleTop.stateCycle()
	buttonShareCircleBottom.stateCycle()
	buttonShareBarTop.stateCycle()
	buttonShareBarBottom.stateCycle()
	buttonShare.stateCycle()
	buttonFacebook.stateCycle()
	buttonTwitter.stateCycle()
	buttonInstagram.stateCycle()
	blurBackground.stateCycle()
