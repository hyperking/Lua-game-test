angle = 0
Level = {
	act = user.currentAct or 1,
	assetsFolder = "graphics/level1/",
	completed = 0,
	captionFont = "graphics/fonts/ptsans-regular.ttf",
	titleFont = "graphics/fonts/ptsans-bold.ttf",
	
	loadLevel = function()

		local textFont = love.graphics.setNewFont(Level.captionFont, 15)
		local boldFont = love.graphics.setNewFont(Level.titleFont, 15)
		love.graphics.setFont(boldFont)
		-- load game background
		bg = Entities:new(Acts[Level.act].environment.bg)
		midGround = Entities:new(Acts[Level.act].environment.midground,{drag=true})
		
		-- load scene objects
		Signs = Entities:newBatch(Acts[1].objects.signs)
		-- Chakras = Entities:newBatch(Acts[1].objects.chakras)

	    love.window.setMode(width, height, {resizable=true, vsync=false, minwidth=400, minheight=300})
		love.graphics.setBackgroundColor(36, 82, 40, 255)
		end,
	
	render = function()
		-- 
		-- call in love draw function
		-- 
		Entities:draw(bg)
		Entities:draw(midGround)
		Entities:drawAll(Signs,{animate=true,sx=.5,sy=.5})
		-- Entities:drawAll(Chakras)

		love.graphics.setColor(255, 255, 255, 255)
		Entities:showCaption(message)
		end,

	updateLevel = function(dt)
		if true then
			angle = angle+dt
		end
		Entities:onDrag(Entities.dragables[activeObject])
		end,

	onMousereleased = function (cursor)
		message = ""
		Entities:onDragStop(Entities.dragables[activeObject],cursor)
		end,
	onMousepressed = function (cursor)
		activeObject = Entities:findActiveEntity(Entities.dragables, cursor)
		message = (activeObject ~= nil) and Acts[1].messages.good or Acts[1].messages.bad
		end
	
}

Acts = {
	
	{
	-- ACT I 
		info = {
			title = "Release Tellu from Pod",
			description = [["Tellu is trapped within a dragon-pod, fully aware and conscious, 
			but unable to move. She realizes that something is draining her energy and she must escape this imprisonment. 
			It is an outside view of the pod with a silhouette of Tellu inside of it. The Chakra points on Tellu are sparkling, 
			and the Chakra symbols or spiritual bodies are floating on the outside of the Pod."]],	
		},
		messages ={
			bad="you must select a chakra..please hurry!!",
			good="good now connect it to a chakra sign"
		},
		environment = {
			bg= {bgImage="BACKGROUND.jpg"},
			midground= {bgImage="S1_POD-TELLU.png",drag=true}
		},
		objects ={
			signs ={
				{
				name = "VIOLET"
				,bgImage = "S1-SIGN-VIOLET-CHAKRA.png"
				,x=540,y=40,width=90,height=90,mode="fill"
				,fillcolor={80,67,167}
				,drag=true
				,ang=50
				},
				{
				name = "green",
				bgImage = "S1-SIGN-GREEN-CHAKRA.png"
				,x=590
				,y=280
				,width=90
				,height=90
				,mode="fill"
				,fillcolor={62,92,35}
				,drag=true
				,ang=150
				}
				,{
				name = "yellow",
				bgImage = "S1-SIGN-YELLOW-CHAKRA.png",
				x=273,y=280,
				width=90,height=90
				,mode="fill"
				,fillcolor={255,255,0}
				,drag=true
				,ang=250
				}
				,{
				name = "blue",
				bgImage = "S1-SIGN-BLUE-CHAKRA.png",
				x=290,y=40,
				width=90,height=90,mode="fill"
				,fillcolor={21,72,219}
				,drag=true
				,ang=350
				}
				,{
				name = "indigo",
				bgImage = "S1-SIGN-INDIGO-CHAKRA.png",
				x=190,
				y=155,
				width=90,
				height=90
				,ang=450
				,mode="fill"
				,fillcolor={30,46,92}
				,drag=true
				},
				{
				name = "red",
				bgImage = "S1-SIGN-RED-CHAKRA.png",
				x=650,y=160,width=90,height=90,mode="fill"
				,fillcolor={255,0,0}
				,drag=true
				,ang=550
				}
				,{
				name = "orange",
				bgImage = "S1-SIGN-ORANGE-CHAKRA.png",
				x=430,y=340,width=90,height=90,mode="fill"
				,fillcolor={215,133,5}
				,drag=true
				,ang=650
				}
			},
			chakras ={
				{
				name = "Lavender"
				,bgImage = "S1-VIOLET-CHAKRA-POINT.png"
				,properties = {x=355,y=40,width=90,height=90,mode="fill",type="circle"
				,fillcolor={80,67,167}
				,drag={ active = false, diffX = 0, diffY = 0 }},
				answer= {355,117}
				},
				{
				name = "indigo",
				bgImage = "S1-INDIGO-CHAKRA-POINT.png",
				properties = {
				x=355,  y=155,
				width=90,
				height=90,
				mode="fill"
				,fillcolor={30,46,92}
				,drag={ active = false, diffX = 0, diffY = 0 }}
				},
				{
				name = "Cyan",
				bgImage = "S1-BLUE-CHAKRA-POINT.png",
				properties = {x=355,y=40,width=90,height=90,mode="fill",type="circle"
				,fillcolor={21,72,219}
				,drag={ active = false, diffX = 0, diffY = 0 }}
				},
				{
				name = "Green",
				bgImage = "S1-GREEN-CHAKRA-POINT.png",
				properties = {x=355,y=280,width=90,height=90,mode="fill",type="circle"
				,fillcolor={62,92,35}
				,drag={ active = false, diffX = 0, diffY = 0 }}
				}
				,{
				name = "Yellow",
				bgImage = "S1-YELLOW-CHAKRA-POINT.png",
				properties = {x=355,y=280,width=90,height=90,mode="fill",type="circle"
				,fillcolor={255,255,0}
				,drag={ active = false, diffX = 0, diffY = 0 }}
				},
				{
				name = "Orange",
				bgImage = "S1-ORANGE-CHAKRA-POINT.png",
				properties = {x=0,y=0,width=90,height=90,mode="fill",type="circle"
				,fillcolor={215,133,5}
				,drag={ active = false, diffX = 0, diffY = 0 }}
				},
				{
				name = "Red",
				bgImage = "S1-RED-CHAKRA-POINT.png",
				properties = {x=650,y=160,width=90,height=90,mode="fill",type="circle"
				,fillcolor={255,0,0}
				,drag={ active = false, diffX = 0, diffY = 0 }}
				},
			}
		}
	
	}
}