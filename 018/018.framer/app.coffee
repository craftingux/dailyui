sketch = Framer.Importer.load("imported/018@1x")
sketch.Background.opacity = 0
active = false

button = new Layer
	x: 0
	y: 0
	width: Screen.width
	height: Screen.height
	backgroundColor: 'transparent'

sketch.Values.opacity = 0

sketch.Water1.y	= 300
sketch.Steps1.y	= 300
sketch.Calories1.y	= 300

activate = () ->
	active = true
	sketch.Water1.animate
		curve: "spring(100, 15, 10)"
		properties:
			y: 40
			AnimationEnd: () ->
				sketch.Values.animate
					curve: "spring(100, 15, 10)"
					delay: 0.4
					properties: 
						opacity: 1
				
	sketch.Steps1.animate
		curve: "spring(100, 15, 10)"
		delay: 0.2
		properties:
			y: 60
	sketch.Calories1.animate
		curve: "spring(100, 15, 10)"
		delay: 0.4
		properties:
			y: 0

deactivate = () ->
	active = false
	sketch.Calories1.animate
		curve: "spring(200, 15, 20)"
		properties:
			y: -20
			scale: 1.1
			AnimationEnd: () ->
				sketch.Calories1.animate
					curve: "spring(100, 15, 10)"
					delay: 0.2
					properties:
						y: 300
						scale: 1
				sketch.Values.animate
					curve: "spring(100, 15, 10)"
					delay: 0.8
					properties: 
						opacity: 0
	sketch.Steps1.animate
		curve: "spring(200, 15, 10)"
		delay: 0.1
		properties:
			y: 40
			scale: 1.1
			AnimationEnd: () ->
				sketch.Steps1.animate
					curve: "spring(100, 15, 10)"
					delay: 0.2
					properties:
						y: 300
						scale: 1
	sketch.Water1.animate
		curve: "spring(200, 15, 10)"
		delay: 0.2
		properties:
			y: 20
			scale: 1.1
			AnimationEnd: () ->
				sketch.Water1.animate
					curve: "spring(100, 15, 10)"
					delay: 0.2
					properties:
						y: 300
						scale: 1

button.on Events.Click, ->
	if !active
		activate()
	else
		deactivate()