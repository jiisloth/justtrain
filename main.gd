extends Node2D

var dur = 0
# Called when the node enters the scene tree for the first time.
func _ready():
    create_water()
    set_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    dur += delta
    var frame = int(dur) % 8
    var wave = frame -3
    var shadows = $Group.get_children()
    shadows[0].position.y = -abs(int(wave*0.25)) - 1
    shadows[1].position.x = abs(int(wave*0.4)) + 2
    shadows[2].position.y = abs(int(wave*0.75)) + 2
    shadows[3].position.x = -abs(int(wave*0.4)) - 2
    $Water.modulate.a = 1- abs(wave)/10.0
    


func create_water():
    var water = $TileMap.get_used_cells(0)
    for w in water:
        var atlasc = $TileMap.get_cell_atlas_coords(0,w)
        atlasc.y = atlasc.y%3 + 9
        $Water.set_cell(0, w, 0, atlasc)
        $Group/WaterShadow.set_cell(0, w, 0, atlasc)
    for pos in [Vector2(1,0),Vector2(0,1),Vector2(-1,0)]:
        var map = $Group/WaterShadow.duplicate()
        map.position = pos
        $Group.add_child(map)

var times = [
    {"player": "st0mba",
    "start": "2023-06-30T19:00:00",
    "end": "2023-06-30T22:00:00",
    "content": "Gaming"},
    {"player": "Matsku",
    "start": "2023-06-30T22:00:00",
    "end": "2023-07-01T04:00:00",
    "content": "Gaming"},
    {"player": "",
    "start": "2023-07-01T04:00:00",
    "end": "2023-07-01T11:00:00",
    "content": "Varikko"},
    {"player": "Datadrako",
    "start": "2023-07-01T11:00:00",
    "end": "2023-07-01T12:00:00",
    "content": "Gaming"},
    {"player": "MegaTron",
    "start": "2023-07-01T12:00:00",
    "end": "2023-07-01T18:00:00",
    "content": "Gaming"},
    {"player": "jsloth",
    "start": "2023-07-01T18:00:00",
    "end": "2023-07-02T16:00:00",
    "content": "Celeste"},
]

func set_text():
    var lbl = $CanvasLayer/NinePatchRect/VBoxContainer/Label
    var container = $CanvasLayer/NinePatchRect/VBoxContainer
    for t in times:
        var l = lbl.duplicate()
        l.text = ""
        container.add_child(l)
        l = lbl.duplicate()
        var start = Time.get_datetime_dict_from_datetime_string(t["start"], false)
        l.text = "%d.%d   %d:%02d" % [start["day"],start["month"],start["hour"],start["minute"]]
        container.add_child(l)
        if t["player"] != "":
            l = lbl.duplicate()
            l.text = t["player"]
            container.add_child(l)
        l = lbl.duplicate()
        l.text = t["content"]
        container.add_child(l)
        
