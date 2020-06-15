extends StaticBody2D


var direction = 0
var speed = 1000
var sprite_height
var viewport_height

func _ready():
	#Engine.target_fps = 30
	sprite_height = self.get_node("sprite").texture.get_size().y * self.get_node("sprite").scale.y
	viewport_height = get_viewport().size.y
	set_process(true)



func _process(delta):

	# Input handling
	if Input.is_action_pressed(self.name + "_down"):
		direction = speed * delta
		
	if Input.is_action_pressed(self.name + "_up"):
		direction = -speed * delta

	
	# Make it impossible to go outside of the screen
	self.position.y = clamp(self.position.y + direction, sprite_height/2, viewport_height - sprite_height/2)
	direction = 0
	
