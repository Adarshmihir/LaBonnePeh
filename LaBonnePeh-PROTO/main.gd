extends Node2D

var tiles: Array[ColorRect] = []
var pawn = ColorRect.new()

var pawnTile
var pawnTileIdx = 0
var pawnCenteredPosX = 0
var pawnCenteredPosY = 0
var pawnCenteredPos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(10): instanciateTile(i)
	pawnTile = tiles[pawnTileIdx]
	
	instanciatePawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pawn.position = updatePawnCenteredPos()
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		pawnTileIdx += 1
		print("space pressed" + str(pawnTileIdx))

func instanciatePawn():
	pawn.size = Vector2(35, 35)
	pawn.color = Color.RED
	
	pawnCenteredPosX = pawnTile.position.x + pawnTile.size.x / 4
	pawnCenteredPosY = pawnTile.position.y + pawnTile.size.y / 4
	pawnCenteredPos = Vector2(pawnCenteredPosX, pawnCenteredPosY)
	pawn.position = pawnCenteredPos
	
	add_child(pawn)

func instanciateTile(i):
	var pos = Vector2(i*100, 300)
	var size = Vector2(75, 75)
	var color = Color.WHITE
	var tile = ColorRect.new()
	tile.position = pos
	tile.size = size
	tile.color = color
	add_child(tile)
	tiles.append(tile)

func updatePawnCenteredPos() -> Vector2:
	pawnTile = tiles[pawnTileIdx]
	pawnCenteredPosX = pawnTile.position.x + pawnTile.size.x / 4
	pawnCenteredPosY = pawnTile.position.y + pawnTile.size.y / 4
	pawnCenteredPos = Vector2(pawnCenteredPosX, pawnCenteredPosY)
	return pawnCenteredPos
