extends Node

var buffer := ""
var max_length := 32

# Map cheat codes to functions
var cheats := {
	"GODMODE": func(): enable_god_mode(),
	"NOCLIP": func(): enable_noclip(),
	"LEVELUP": func(): level_up(),
	"GIVEALL": func(): give_all_items(),
	"LASTMILE": func(): last_mile(),
}

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		var char := OS.get_keycode_string(event.keycode)

		# Only accept A–Z and numbers
		if char.length() == 1 and char.is_valid_identifier():
			buffer += char
			buffer = buffer.right(buffer.length() - max_length) if buffer.length() > max_length else buffer
			_check_cheats()

		# Optional: backspace support
		if event.keycode == KEY_BACKSPACE and buffer.length() > 0:
			buffer = buffer.substr(0, buffer.length() - 1)

func _check_cheats() -> void:
	for code in cheats.keys():
		if buffer.ends_with(code):
			print("Cheat activated: ", code)
			cheats[code].call()
			buffer = ""  # reset after activation

# --- Cheat implementations ---
func enable_god_mode():
	#GameData.player_invincible = true
	print("God mode ON")

func enable_noclip():
	#GameData.player_noclip = true
	print("Noclip ON")

func level_up():
	#GameData.level += 1
	print("Level increased")

func give_all_items():
	#GameData.inventory = GameData.ALL_ITEMS.duplicate()
	print("All items granted")

func last_mile():
	print("Last mile, almost done!")
