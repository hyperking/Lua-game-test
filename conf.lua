-- Load game configurations.
function love.conf(t)
	t.modules.joystick = true
	t.modules.audio = true
	t.modules.keyboard = true
	t.modules.event = true
	t.modules.image = true
	t.modules.graphics = true
	t.modules.timer = true
	t.modules.thread = true
	t.modules.physics = true
	
	t.console = false
	t.identity = "data"                    -- The name of the save directory (string)
	t.version = "0.10.2"
	t.title = "Example Game"
	t.author = "Hyper King"
	t.window.fullscreen = false
	t.window.height = 600
	t.window.width = 800
	t.window.vsync = true
	t.window.fsaa = 1

end