extends Line2D


@export var underwater: bool = false
@export var uw_texture: Texture2D 
@export var start: NodePath
@export var end: NodePath



func _ready():
    if underwater:
        texture = uw_texture
    var path:Curve2D = get_parent().curve
    var startpoint = path.get_closest_point(get_node(start).position)  
    var endpoint = path.get_closest_point(get_node(end).position)  
    var ppoints = path.get_baked_points()
    var started = false

    for point in ppoints:
        if point == startpoint and not started:
            started = true
        if started:
            add_point(point)
        if point == endpoint:
            break
        
    
    
        
var age = 0
func _process(delta):
    if underwater:
        age += delta
        var frame = int(age) % 8
        var wave = frame -3
        modulate.a = 0.5 + wave*0.05

