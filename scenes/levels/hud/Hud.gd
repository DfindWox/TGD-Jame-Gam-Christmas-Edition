extends Control


func _ready():
	pass


var timer := 0.0
var timer2 := 0.0
func _process(_delta):
	# debug
	#_test_ui(_delta)
	
	set_present_count(PlayerData.score/100.0)
	set_strike_count(PlayerData.strikes)


func set_present_count(value):
	%LabelPresentsCount.text = "%02d" % [value]


func set_strike_count(value):
	print_debug("strikes: ", value)
	%StrikesBarFront.size.x = clamp(value*60,0,180)




func _test_ui(delta):
	timer += delta*4
	if timer > 1.0:
		PlayerData.add_score()
		timer -= 1.0
	timer2 += delta*0.5
	if timer2 > 1.0:
		PlayerData.add_strike()
		timer2 -= 1.0
