Framer.Defaults.Layer.backgroundColor = 'transparent'

bg = new Layer
	backgroundColor: '#3D3D4D'
	width: Screen.width
	height: Screen.height

header = new Layer
	backgroundColor: '#FFFFFF'
	x: 0
	y: 0
	width: Screen.width
	height: 88
	shadowX: 0
	shadowY: 2
	shadowColor: 'rgba(0, 0, 0, 0.2)'
	shadowBlur: 12

prefs = {}

prefs.styles = {}
prefs.styles.textNavigation = 
	fontFamily: 'helvetica, sans-serif'
	fontSize: '14px'
	fontWeight: 'bold'
	textAlign: 'center'

prefs.option_closed = {}
prefs.option_closed.body =
	backgroundColor: '#FFFFFF'
	width: 250
	height: 400
prefs.option_closed.header =
	height: 66
	x: 0
	y: 0

header_menu_features = new Layer
	html: 'FEATURES'
	style: prefs.styles.textNavigation
	backgroundColor: 'transparent'
	width: 80
	height: 30
	x: Screen.width - 270
	y: 30
	color: '#3D3D4D'

header_menu_pricing= new Layer
	html: 'PRICING'
	style: prefs.styles.textNavigation
	backgroundColor: 'transparent'
	width: 70
	height: 30
	x: Screen.width - 170
	y: 30
	color: '#3DCD7D'

header_menu_login = new Layer
	html: 'LOGIN'
	style: prefs.styles.textNavigation
	backgroundColor: 'transparent'
	width: 60
	height: 30
	x: Screen.width - 80
	y: 30
	color: '#3D3D4D'

option_1 = new Layer
	backgroundColor: prefs.option_closed.body.backgroundColor
	x: 123
	y: 269
	height: prefs.option_closed.body.height
	width: prefs.option_closed.body.width

option_1_header = new Layer
	superLayer: option_1
	backgroundColor: '#43B4FE'
	x: prefs.option_closed.header.x
	y: prefs.option_closed.header.y
	width: option_1.width
	height: prefs.option_closed.header.height

option_1_header_text = new Layer
	superLayer: option_1_header
	html: 'PERSONAL: <small>$4.99*</small>'

option_1_purchase = new Layer
	superLayer: option_1
	backgroundColor: "rgba(152,207,254,1)"
	height: 44
	width: option_1.width
	x: 0
	y: option_1.height - 44

# ======

option_2 = new Layer
	backgroundColor: prefs.option_closed.body.backgroundColor
	x: 397
	y: 269
	height: prefs.option_closed.body.height
	width: prefs.option_closed.body.width

option_2_header = new Layer
	superLayer: option_2
	backgroundColor: '#977DD7'
	x: prefs.option_closed.header.x
	y: prefs.option_closed.header.y
	width: option_2.width
	height: prefs.option_closed.header.height

option_2_header_text = new Layer
	superLayer: option_2_header
	html: 'PRO: <small>$19.99*</small>'

option_2_purchase = new Layer
	superLayer: option_2
	height: 44
	width: option_2.width
	x: 0
	y: option_1.height - 44
	backgroundColor: "rgba(197,183,215,1)"

# ======

option_2.on Events.Click, ->
	option_2.x = 0
	option_2.y = 100
	option_2.width = 500
	option_2_header.width = option_2.width
	option_2_purchase.x = option_2.width - option_2_purchase.width
