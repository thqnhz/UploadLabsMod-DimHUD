extends "res://scripts/hud.gd"

var _hud_containers: Array[Control] = []
var _target_opacities: Dictionary = {}
const DIM_ALPHA = 0.35
const NORMAL_ALPHA = 1.0
const TWEEN_SPEED = 0.2

func _ready() -> void:
    super._ready()
    _init_containers()


func _init_containers() -> void:
    var paths = [
        "Main/MainContainer/Overlay/TopLeftContainer",
        "Main/MainContainer/Overlay/ProgressButtons",
        "Main/MainContainer/Overlay/ScreenButtons",
        "Main/MainContainer/Overlay/ExtrasButtons",
        "Main/MainContainer/Overlay/BottomButtons",
        "Main/MainContainer/Overlay/ToolsBar",
		"Main/MainContainer/Overlay/OptionsBar"
    ]

    for path in paths:
        var node = get_node_or_null(path)
        if node and node is Control:
            _hud_containers.append(node)
            _target_opacities[node] = DIM_ALPHA
            node.modulate.a = DIM_ALPHA


func _process(delta: float) -> void:
    super._process(delta)

    var mouse_pos = get_viewport().get_mouse_position()

    for node in _hud_containers:
        if not node.visible:
            continue

        var rect = node.get_global_rect()
        var is_hovered = rect.has_point(mouse_pos)

        var target = NORMAL_ALPHA
        if not is_hovered:
            target = DIM_ALPHA

        if _target_opacities[node] != target:
            _target_opacities[node] = target
            var tween = create_tween()
            tween.tween_property(node, "modulate:a", target, TWEEN_SPEED).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
