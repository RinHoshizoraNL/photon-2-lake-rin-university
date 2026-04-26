if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent()

COMPONENT.Author = "Photon"

COMPONENT.Credits = {
	Model = "SGM",
	Code = "SGM"
}

COMPONENT.PrintName = [[Federal Signal Jetstream LRUPD]]

COMPONENT.Model = "models/sentry/props/jetstream.mdl"

COMPONENT.SubMaterials = {

}

local wScale = 0.9
local bScale = 0.66
local rScale = 0.66

local blue = { r = 0, g = 255, b = 255 }
local red = { r = 255, g = 64, b = 0 }
local amber = { r = 255, g = 100, b = 0 }

COMPONENT.ElementStates = {
	["Mesh"] = {
		["OFF"] = { Intensity = 0, IntensityTransitions = true },
		["~B"] = { 
			Inherit = "B",
			Intensity = 1,
			IntensityTransitions = true,	
		},
		["~SW"] = { 
			Inherit = "SW",
			Intensity = 1,
			IntensityTransitions = true,	
		},
	},
	["Projected"] = {
		["~B"] = {
			Inherit = "B",
			Intensity = 1,
			IntensityTransitions = true,
		},
		["~SW"] = {
			Inherit = "SW",
			Intensity = 1,
			IntensityTransitions = true,
		},
	},
	["Bone"] = {
		["Sweep"] = {
			Activity = "Sweep",
			SweepStart = 360,
			SweepEnd = 0,
			Speed = 900,
			Direction = -1,
			SweepPause = 0.05,
		},
	},
	["2D"] = {
		["~B"] = { 
			Inherit = "B",
			Intensity = 1,
			IntensityTransitions = true,	
		},
		["~SW"] = { 
			Inherit = "SW",
			Intensity = 1,
			IntensityTransitions = true,	
		},
	}
}

COMPONENT.Templates = {
	["2D"] = {
		Light = {
			Width = 7.7,
			Height = 7.7,
			Scale = 1.25,
		},
	},
	["Bone"] = {
		Rotator = {},
	},
	["Mesh"] = {
		Mesh = {
			Model = "models/sentry/props/jetstream_lights.mdl",
			Scale = 1.0,
			IntensityGainFactor = 10,
			IntensityLossFactor = 4,
			DeactivationState = "~OFF",
		},
	},
	["Projected"] = {
		Projected = {
			IntensityGainFactor = 12,
			IntensityLossFactor = 6,
			DeactivationState = "OFF",
		},
	}
}

COMPONENT.StateMap = "[~B] 13 15 18 20 2 3 12 14 16 17 19 21 22 23 [~SW] 1 4 [R] 5 [A] 6 [ROT] 7 8 9 10 11"

local fov = 180

COMPONENT.Elements = {
	[1] = { "Mesh", Vector( 0, 0, 0 ), Angle( 0, -90, 0 ), "sentry/props/jetstream/lights/1", DrawMaterial = "sentry/props/jetstream/lights/lights_on", },
	[2] = { "Mesh", Vector( 0, 0, 0 ), Angle( 0, -90, 0 ), "sentry/props/jetstream/lights/2", DrawMaterial = "sentry/props/jetstream/lights/lights_on", },
	[3] = { "Mesh", Vector( 0, 0, 0 ), Angle( 0, -90, 0 ), "sentry/props/jetstream/lights/3", DrawMaterial = "sentry/props/jetstream/lights/lights_on", },
	[4] = { "Mesh", Vector( 0, 0, 0 ), Angle( 0, -90, 0 ), "sentry/props/jetstream/lights/4", DrawMaterial = "sentry/props/jetstream/lights/lights_on", },
	[5] = { "Mesh", Vector( 0, 0, 0 ), Angle( 0, -90, 0 ), "sentry/props/jetstream/lights/5", DrawMaterial = "sentry/props/jetstream/lights/lights_on", },
	[6] = { "Mesh", Vector( 0, 0, 0 ), Angle( 0, -90, 0 ), "sentry/props/jetstream/lights/6", DrawMaterial = "sentry/props/jetstream/lights/lights_on", },

	[7] = { "Rotator", BoneId = 2, Axis = "z", Speed = -960 },
	[8] = { "Rotator", BoneId = 3, Axis = "z", Speed = -600 },
	[9] = { "Rotator", BoneId = 5, Axis = "z", Speed = -1000 },
	[10] = { "Rotator", BoneId = 4, Axis = "z", Speed = -595 },
	[11] = { "Rotator", BoneId = 1, Axis = "z", Speed = -857.5 },

	[12] = { "Mesh", Vector( 0, 0, 0 ), Angle( -90, 0, 0 ), "sentry/props/jetstream/lights/rot", DrawMaterial = "sentry/props/jetstream/lights/lights_on", BoneParent = 2,},
	[13] = { "Mesh", Vector( 0, 0, 0 ), Angle( -90, 0, 0 ), "sentry/props/jetstream/lights/rot", DrawMaterial = "sentry/props/jetstream/lights/lights_on", BoneParent = 3,},
	[14] = { "Mesh", Vector( 0, 0, 0 ), Angle( -90, 0, 0 ), "sentry/props/jetstream/lights/rot", DrawMaterial = "sentry/props/jetstream/lights/lights_on", BoneParent = 5,},
	[15] = { "Mesh", Vector( 0, 0, 0 ), Angle( -90, 0, 0 ), "sentry/props/jetstream/lights/rot", DrawMaterial = "sentry/props/jetstream/lights/lights_on", BoneParent = 4,},
	[16] = { "Mesh", Vector( 0, 0, 0 ), Angle( -90, 0, 0 ), "sentry/props/jetstream/lights/rot", DrawMaterial = "sentry/props/jetstream/lights/lights_on", BoneParent = 1,},

	[17] = { "Light", Vector( 0, 0, 1 ), Angle( -90, 0, 0 ), BoneParent = 2,},
	[18] = { "Light", Vector( 0, 0, 1 ), Angle( -90, 0, 0 ), BoneParent = 3,},
	[19] = { "Light", Vector( 0, 0, 1 ), Angle( -90, 0, 0 ), BoneParent = 5,},
	[20] = { "Light", Vector( 0, 0, 1 ), Angle( -90, 0, 0 ), BoneParent = 4,},
	[21] = { "Light", Vector( 0, 0, 1 ), Angle( -90, 0, 0 ), BoneParent = 1,},

	[22] = { "Projected", Vector( 6.671, -2.352, 6.859 ), Angle( 0, 180, 0 ), FOV = 70, Brightness = 0.65,},
	[23] = { "Projected", Vector( -6.671, -2.352, 6.859 ), Angle( 0, 180, 0 ), FOV = 70, Brightness = 0.65,},
}

COMPONENT.ElementGroups = {
	["ROTS"] = { 7, 8, 9, 10, 11, },
	["ROT_LIGHTS"] = { 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,},
}

local sequence = Photon2.SequenceBuilder.New

COMPONENT.Segments = {
	Rotators = {
		Frames = {
			[1] = "ROTS ROT_LIGHTS",
		},
		Sequences = {
			ON = {
				1,
			}
		}
	},
	Lights = {
		Frames = {
			[0] = "[~OFF] 1 4 5 6",
			[1] = "1 5 [~OFF] 4 6",
			[2] = "4 6 [~OFF] 1 5",
		},
		Sequences = {
			ON = sequence()
			:Steady(1,7)
			:Steady(0,2)
			:Steady(2,7)
			:Steady(0,2)
		}
	},
	Takedown = {
		Frames = {
			[0] = "[~OFF] 2 3 22 23",
			[1] = "2 3 22 23",
		},
		Sequences = {
			TAKEDOWN = {1},
		}
	},
}

COMPONENT.Inputs = {
	["Emergency.Warning"] = {
		["MODE1"] = {
			Lights = "ON",
			Rotators = "ON",
		},
		["MODE2"] = {
			Lights = "ON",
			Rotators = "ON",
		},
		["MODE3"] = {
			Lights = "ON",
			Rotators = "ON",
		},
	},
	["Emergency.SceneForward"] = {
		["ON"] = {
			Takedown = "TAKEDOWN"
		},
	},
}