extends CanvasLayer


func _ready():
	pass


var timer := 0.0
var timer2 := 0.0
func _process(_delta):
	# debug
	#_test_ui(_delta)
	
	set_present_count()
	set_strike_count(PlayerData.strikes)


func set_present_count():
	%LabelPresentsCount.text = "%02d" % [PlayerData.score]
	%LabelPresentsMaxCount.text = "/ %02d" % [PlayerData.required_score]


func set_strike_count(value):
	#print_debug("strikes: ", value)
	%StrikesBarFront.size.x = clamp(value*128,0,128*5)




func _test_ui(delta):
	timer += delta*4
	if timer > 1.0:
		PlayerData.add_score()
		timer -= 1.0
	timer2 += delta*0.5
	if timer2 > 1.0:
		PlayerData.add_strike()
		timer2 -= 1.0
