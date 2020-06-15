extends KinematicBody2D

var vel 


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	vel = Vector2(((randi() & 2) - 1) * 1000, 0);



func _physics_process(delta):
	var collision = move_and_collide(vel * delta)
	if collision:
		
		if collision.collider.name == "Wall1":
			var label = get_parent().get_node("Control/player2_score")
			label.text = String(int(label.text) + 1)
			self.position = Vector2(1500, 850)
			vel.x = -vel.x;
		
		if collision.collider.name == "Wall2":
			var label = get_parent().get_node("Control/player1_score")
			label.text = String(int(label.text) + 1)
			self.position = Vector2(1500, 850)
			vel.x = -vel.x;
		
		vel.y = -vel.y;
		
		if "player" in collision.collider.name:
			vel.x = -vel.x;
		
		vel.y = (position.y - collision.collider.position.y) * 4

