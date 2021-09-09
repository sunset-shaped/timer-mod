extends CanvasLayer #actually this can be any node since it's not doing anything


var base:Node #important! you should do this for every mod. create the node for base where you can get access to almost everything

func _ready():
	base = get_node("/root/base") #define base. always do this
	

func _process(delta):
	#every frame, we update timer and send it to base
	#the set_hud_text function should be used if your mod only has one value to update. this makes it compatible with the other mods.
	base.set_hud_text("timer", make_time(base.timer))
	#use the make_time function to turn the time into a string
	

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

