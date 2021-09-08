extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var base:Node
var text:Node

onready var pos = $Control
# Called when the node enters the scene tree for the first time.
func _ready():
	base = get_node("/root/base")
	text = load("res://level stuff/text.tscn").instance()
	pos.add_child(text)
	print("A")
	
	pos.position = Vector2(5, 5)

func _process(delta):
	text.bbcode_text = make_time(base.timer)
	

func make_time(timetaken):
	var taken = stepify(timetaken, 0.01)
	
	var hr = floor(taken/3600)
	var mn = floor(taken/60) - (hr * 60)
	var sc = floor(taken) - (mn*60) - (hr*3600)
	var mls = fmod(taken,1) * 100
	
	if hr == 0:
		return "%02d:%02d.%02d" % [mn, sc, mls]
	else:
		return "%d:%02d:%02d.%02d" % [hr, mn, sc, mls]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
