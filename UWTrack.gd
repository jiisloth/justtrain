extends Line2D

var age = 0
func _process(delta):
    return
    age += delta
    var frame = int(age) % 8
    var wave = frame -3
    modulate.a = 0.5 + wave*0.05
