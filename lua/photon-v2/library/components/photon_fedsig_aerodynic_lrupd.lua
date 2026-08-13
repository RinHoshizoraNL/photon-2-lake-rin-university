if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent()

COMPONENT.Author = "SGM"

COMPONENT.Credits = {
	Model = "SGM",
	Code = "SGM"
}

COMPONENT.PrintName = [[Federal Signal Aerodynic Shirojo]]

COMPONENT.Model = "models/sentry/props/aerodynic2.mdl"

COMPONENT.SubMaterials = {
	[2] = "rin/university/props/aerodynic",
}

COMPONENT.States = {
	[1] = "~B",
	[2] = "~B",
	[3] = "B",
	[4] = "SW",
	[5] = "B",
	[6] = "B",
	[7] = "SW",
	[8] = "B",
	[9] = "~B",
	[10] = "~B",
}

COMPONENT.ElementStates = {
	["2D"] = {
		["~OFF"] = {
			Intensity = 0,
			IntensityTransitions = true,
			IntensityGainFactor = 9,
			IntensityLossFactor = 12,
		},
	},
	["Mesh"] = {
		["~OFF"] = { Intensity = 0, IntensityTransitions = true },
		["~R"] = {
			Inherit = "R",
			IntensityTransitions = true,
			IntensityGainFactor = 9,
			IntensityLossFactor = 12,
		},
	}
}

COMPONENT.Templates = {
	["2D"] = {
		Light_invis = {
			Width = 7.7,
			Height = 7.7,
			Scale = 2.0,
			VisibilityRadius = 2,
		},
	},
	["Bone"] = {
		Rotator = {}
	},
	["Mesh"] = {
		Mesh = {
			Model = "models/sentry/props/aerodynic_light.mdl",
			Scale = 1.0,
			IntensityGainFactor = 5,
			IntensityLossFactor = 5,
			DeactivationState = "~OFF",
		},
	},
}

COMPONENT.StateMap = "[ROT] 1 2 3 4 5 6 [1] 7 [2] 8 [3] 9 15 [4] 10 16 [5] 11 17 [6] 12 18 [7] 13 19 [8] 14 20 [9] 21 [10] 22"

local fov = 90

COMPONENT.Elements = {
	[1] = { "Rotator", BoneId = 3, Axis = "z", Speed = -380 },
	[2] = { "Rotator", BoneId = 2, Axis = "z", Speed = 250 },
	[3] = { "Rotator", BoneId = 1, Axis = "z", Speed = -380 },
	[4] = { "Rotator", BoneId = 5, Axis = "z", Speed = -380 },
	[5] = { "Rotator", BoneId = 6, Axis = "z", Speed = 250 }, -- 5
	[6] = { "Rotator", BoneId = 7, Axis = "z", Speed = -380 }, -- 3

	[7] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( 90, -90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 4 },
	[8] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( -90, -90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 4 },

	[9] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( 90, -90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 3 },
	[10] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( 90, -90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 2 },
	[11] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( 90, -90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 1 },
	[12] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( -90, 90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 5 },
	[13] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( -90, 90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 6 },
	[14] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( -90, 90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 7 },

	[15] = { "Light_invis", Vector( 0.0, 0.0, -1.0 ), Angle( 90, 0, 90 ), BoneParent = 3 },
	[16] = { "Light_invis", Vector( 0.0, 0.0, -1.0 ), Angle( 90, 0, 90 ), BoneParent = 2 },
	[17] = { "Light_invis", Vector( 0.0, 0.0, -1.0 ), Angle( 90, 0, 90 ), BoneParent = 1 },
	[18] = { "Light_invis", Vector( 0.0, 0.0, 1.0 ), Angle( -90, 0, 90 ), BoneParent = 5 },
	[19] = { "Light_invis", Vector( 0.0, 0.0, 1.0 ), Angle( -90, 0, 90 ), BoneParent = 6 },
	[20] = { "Light_invis", Vector( 0.0, 0.0, 1.0 ), Angle( -90, 0, 90 ), BoneParent = 7 },

	[21] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( -90, 90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 8 },
	[22] = { "Mesh", Vector( 0.0, 0.0, 0.0 ), Angle( 90, 90, 90 ), "sentry/props/aerodynic2/light", DrawMaterial = "sentry/props/c3xl/glow_gradient_a", BoneParent = 8 },


}

COMPONENT.ElementGroups = {
	["ROTS"] = { 1, 2, 3, 4, 5, 6,},
	["LIGHTS"] = { 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,},
	["LIGHTS_FAKE"] = { },
}

local sequence = Photon2.SequenceBuilder.New

COMPONENT.Segments = {
	Rotators = {
		Frames = {
			[1] = "ROTS",
		},
		Sequences = {
			ON = {
				1,
			}
		}
	},
	Mesh = {
		Frames = {
			[1] = "LIGHTS LIGHTS_FAKE"
		},
		Sequences = {
			ON = { 1 }
		}
	},
	Flashers = {
		Frames = {
			[0] = "[~OFF] 7 8 21 22",
			[1] = "7 8",
			[2] = "21 22"
		},
		Sequences = {
			ON = sequence():Alternate(1,2,7),
		}
	},
}

COMPONENT.Inputs = {
	["Emergency.Warning"] = {
		["MODE1"] = {
			Rotators = "ON",
			Mesh = "ON",
			Flashers = "ON",
		},
		["MODE2"] = {
			Rotators = "ON",
			Mesh = "ON",
			Flashers = "ON",
		},
		["MODE3"] = {
			Rotators = "ON",
			Mesh = "ON",
			Flashers = "ON",
		},
	}
}