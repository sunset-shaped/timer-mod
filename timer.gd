extends CanvasLayer #actually this can be any node since it's not doing anything


var base:Node #important! you should do this for every mod. create the node for base where you can get access to almost everything

func _ready():
	base = get_node("/root/base") #define base. always do this
	

func _process(delta):
	#every frame, we update timer and send it to base
	#the set_hud_text function should be used if your mod only has one value to update. this makes it compatible with the other mods.
	base.set_hud_text("timer", base.menu.make_time(base.timer))
	#use the make_time function to turn the time into a string
	
