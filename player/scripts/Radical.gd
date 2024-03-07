extends CenterContainer

@export var RATICLE_LINES : Array[Line2D];
@export var PLAYER_CONTROLLER : CharacterBody3D;
@export var RATICLE_SPEED : float = 0.25;
@export var RATICLE_DISTANCE : float = 2.0;
@export var DOT_RADIUS : float = 1.0;
@export var DOT_COLOR : Color  = Color.WHITE; 

# Called when the node enters the scene tree for the first time.
func _ready():
	queue_redraw();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	adjust_raticle_lines();

func _draw():
	draw_circle(Vector2(0,0),DOT_RADIUS,DOT_COLOR);
	

func adjust_raticle_lines():
	var velocity = PLAYER_CONTROLLER.get_real_velocity();
	var origin = Vector3(0,0,0);
	var pos = Vector2(0,0);
	var speed = origin.distance_to(velocity)
	
	# Adjust Raticle line position
	RATICLE_LINES[0].position = lerp(RATICLE_LINES[0].position,pos+Vector2(0,-speed*RATICLE_SPEED),RATICLE_SPEED);#top
	RATICLE_LINES[1].position = lerp(RATICLE_LINES[1].position,pos+Vector2(speed*RATICLE_SPEED,0),RATICLE_SPEED);#right
	RATICLE_LINES[2].position = lerp(RATICLE_LINES[2].position,pos+Vector2(0,speed*RATICLE_SPEED),RATICLE_SPEED);#bottom
	RATICLE_LINES[3].position = lerp(RATICLE_LINES[3].position,pos+Vector2(-speed*RATICLE_SPEED,0),RATICLE_SPEED);#left
	
	
	
	
	
	

