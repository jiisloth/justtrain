extends Node2D

@onready var pathfollow = $Track/Train
@onready var train = $Track/Train/Train 
# Called when the node enters the scene tree for the first time.

func _ready():
    $TrackPoints.hide()
            
func _process(delta):
    train.global_position = pathfollow.global_position + Vector2(0,-5)
    train.global_rotation = 0
    train.frame = int(round((pathfollow.rotation_degrees+90)/(360/8.0))+4) % 8
    pathfollow.progress += delta*10

