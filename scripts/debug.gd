extends PanelContainer

@onready var property_container = %VBoxContainer

var property;
var frames_per_second:String; 

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false;
	add_debug_property("FPS",frames_per_second)

func _input(event):
	#toggle debug pannel
	if event.is_action_pressed('debug'):
		visible = !visible;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		frames_per_second = "%.2f"%(1.0/delta);#get frames per second every frame
		#frames_per_second = Engine.get_frames_per_second() #get frames per second every second
		property.text = property.name+": "+frames_per_second;

func add_debug_property(title:String,value):
	property = Label.new();#create new label node
	property_container.add_child(property);
	property.name = title;
	property.text = property.name+value;
	
	
