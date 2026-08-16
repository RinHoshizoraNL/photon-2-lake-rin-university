if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent()
local sequence = Photon2.SequenceBuilder.New

COMPONENT.Author = "Photon"

COMPONENT.Credits = {
	Model = "OfficerFive0",
	Code = "Schmal"
}

COMPONENT.Title = [[Whelen Legacy LRUPD (48")]]
COMPONENT.Category = "Lightbar"
COMPONENT.Model = "models/schmal/whelen_legacy_48.mdl"

COMPONENT.Preview = {
	Position = Vector( 0, 0, -0.5 ),
	Angles = Angle( 0, 180, 0 ),
	Zoom = 1
}

local priW = 3.1
local priH = priW / 2

local tirW = 3.16
local tirH = tirW / 2

COMPONENT.States = {
	[1] = "R",
	[2] = "B"
}

COMPONENT.Templates = {
	["2D"] = {
		Primary = {
			Width 	= priW,
			Height	= priH,
			Shape = PhotonMaterial.GenerateLightQuad("photon/lights/legacy_module_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("photon/lights/legacy_module_detail.png").MaterialName,
			Scale = 0.9,
			ForwardVisibilityOffset = 0,
			VisibilityRadius = 0.6,
			IntensityGainFactor = 3,
			IntensityLossFactor = 3,
		},
		TIR3 = {
			Width 	= tirW,
			Height	= tirH,
			Shape = PhotonMaterial.GenerateLightQuad("photon/lights/legacy_tir3_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("photon/lights/legacy_tir3_shape.png").MaterialName,
			-- Detail = PhotonMaterial.GenerateLightQuad("photon/lights/sm_whe_lib_ii_primary_detail.png").MaterialName,
			Scale = 2,
			ForwardVisibilityOffset = 0,
			VisibilityRadius = 0.6
		}
	},
	["Projected"] = {
		Illumination = {
			Material = "photon/flashlight/led_linear.png",
			NearZ = 100,
			FOV = 50,
			Brightness = 3
		}
	}
}


COMPONENT.Elements = {
	[1] = { "Primary", Vector( 6.85, 5.67, 0.22 ), Angle( 0, -90, 0 ) },
	[2] = { "Primary", Vector( 6.85, -5.67, 0.22 ), Angle( 0, -90, 0 ) },

	[3] = { "Primary", Vector( 6.85, 8.74, 0.22 ), Angle( 0, -90, 0 ) },
	[4] = { "Primary", Vector( 6.85, -8.74, 0.22 ), Angle( 0, -90, 0 ) },

	[5] = { "Primary", Vector( 6.85, 11.95, 0.22 ), Angle( 0, -90, 0 ) },
	[6] = { "Primary", Vector( 6.85, -11.95, 0.22 ), Angle( 0, -90, 0 ) },
	
	[7] = { "Primary", Vector( 6.85, 15.02, 0.22 ), Angle( 0, -90, 0 ) },
	[8] = { "Primary", Vector( 6.85, -15.02, 0.22 ), Angle( 0, -90, 0 ) },
	
	[9] = { "Primary", Vector( 6.85, 18.25, 0.22 ), Angle( 0, -90, 0 ) },
	[10] = { "Primary", Vector( 6.85, -18.25, 0.22 ), Angle( 0, -90, 0 ) },

	[11] = { "Primary", Vector( 6.85, 21.32, 0.22 ), Angle( 0, -90, 0 ) },
	[12] = { "Primary", Vector( 6.85, -21.32, 0.22 ), Angle( 0, -90, 0 ) },

	[13] = { "Primary", Vector( 6.85, 24.6, 0.22 ), Angle( 0, -90, 0 ) },
	[14] = { "Primary", Vector( 6.85, -24.6, 0.22 ), Angle( 0, -90, 0 ) },
	
	[15] = { "Primary", Vector( 5.72, 27.18, 0.22 ), Angle( 0, -90 + 47.5, 0 ) },
	[16] = { "Primary", Vector( 5.72, -27.18, 0.22 ), Angle( 0, -90 - 47.5, 0 ) },
	
	[17] = { "Primary", Vector( 3.3, 29.4, 0.22 ), Angle( 0, -90 + 47.5, 0 ), Width = 3.5 },
	[18] = { "Primary", Vector( 3.3, -29.4, 0.22 ), Angle( 0, -90 - 47.5, 0 ), Width = 3.5 },

	[19] = { "Primary", Vector( -3.3, 29.4, 0.22 ), Angle( 0, 90 - 47.5, 0 ), Width = 3.5 },
	[20] = { "Primary", Vector( -3.3, -29.4, 0.22 ), Angle( 0, 90 + 47.5, 0 ), Width = 3.5 },

	[21] = { "Primary", Vector( -5.72, 27.18, 0.22 ), Angle( 0, 90 - 47.5, 0 ) },
	[22] = { "Primary", Vector( -5.72, -27.18, 0.22 ), Angle( 0, 90 + 47.5, 0 ) },

	[23] = { "Primary", Vector( -6.85, 24.6, 0.22 ), Angle( 0, 90, 0 ) },
	[24] = { "Primary", Vector( -6.85, -24.6, 0.22 ), Angle( 0, 90, 0 ) },

	[25] = { "Primary", Vector( -6.85, 21.32, 0.22 ), Angle( 0, 90, 0 ) },
	[26] = { "Primary", Vector( -6.85, -21.32, 0.22 ), Angle( 0, 90, 0 ) },

	[27] = { "Primary", Vector( -6.85, 18.25, 0.22 ), Angle( 0, 90, 0 ) },
	[28] = { "Primary", Vector( -6.85, -18.25, 0.22 ), Angle( 0, 90, 0 ) },

	[29] = { "Primary", Vector( -6.85, 15.02, 0.22 ), Angle( 0, 90, 0 ) },
	[30] = { "Primary", Vector( -6.85, -15.02, 0.22 ), Angle( 0, 90, 0 ) },

	[31] = { "Primary", Vector( -6.85, 11.95, 0.22 ), Angle( 0, 90, 0 ) },
	[32] = { "Primary", Vector( -6.85, -11.95, 0.22 ), Angle( 0, 90, 0 ) },

	[33] = { "Primary", Vector( -6.85, 8.74, 0.22 ), Angle( 0, 90, 0 ) },
	[34] = { "Primary", Vector( -6.85, -8.74, 0.22 ), Angle( 0, 90, 0 ) },

	[35] = { "Primary", Vector( -6.85, 5.67, 0.22 ), Angle( 0, 90, 0 ) },
	[36] = { "Primary", Vector( -6.85, -5.67, 0.22 ), Angle( 0, 90, 0 ) },

	[37] = { "Primary", Vector( -6.85, 2.31, 0.22 ), Angle( 0, 90, 0 ) },
	[38] = { "Primary", Vector( -6.85, -2.31, 0.22 ), Angle( 0, 90, 0 ) },

	[39] = { "TIR3", Vector( 6.85, 2.31, 0.23 ), Angle( 0, -90, 0 ) },
	[40] = { "TIR3", Vector( 6.85, -2.34, 0.23 ), Angle( 0, -90, 0 ) },

	[41] = { "TIR3", Vector( 0, 30.75, 0.23 ), Angle( 0, 0, 0 ) },
	[42] = { "TIR3", Vector( 0, -30.75, 0.23 ), Angle( 0, 180, 0 ) },

	[43] = { "Illumination", Vector( 7.5, 0, 0.23 ), Angle( 5, -90, 0 ), },
	[44] = { "Illumination", Vector( 7.5, 0, 0.23 ), Angle( 2, -90, 0 ), FOV = 90, Brightness = 1.5, Material = "photon/flashlight/wide.png" },

	[45] = { "Illumination", Vector( 0, 31, 0.23 ), Angle( 0, 0, 0 ), FOV = 90, Brightness = 1.5},
	[46] = { "Illumination", Vector( 0, -31, 0.23 ), Angle( 5, 180, 0 ), FOV = 90, Brightness = 1.5 },
}


COMPONENT.ElementStates = {
	["2D"] = {
		["~TA"] = {
			Inherit = "A",
			IntensityTransitions = true,
			IntensityGainFactor = 5,
			IntensityLossFactor = 5,
		}
	},
	["Bone"] = {
		[1] = {
			Inherit = "B",
			SuppressInheritanceFailure = true
		}
	}
}

COMPONENT.ElementGroups = {
	["@01"] = { 1, 3 },
	["@02"] = { 2, 4 },
	["@03"] = { 5, 7 },
	["@04"] = { 6, 8 },
	["@05"] = { 9, 11 },
	["@06"] = { 10, 12 },
	["@07"] = { 13, 15, 17 },
	["@08"] = { 14, 16, 18 },
	["@09"] = { 19, 21, 23 },
	["@10"] = { 20, 22, 24 },
	["@11"] = { 25, 27 },
	["@12"] = { 26, 28 },
	["@13"] = { 29, 31 },
	["@14"] = { 30, 32 },
	["@15"] = { 33, 35 },
	["@16"] = { 34, 36 },
	["@17"] = { 37 },
	["@18"] = { 38 },
	["Takedown"] = { 39, 40 },
	["Left"] = { 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37 },
	["Left_Front"] = { 1, 3, 5, 7, 9, 11, 13, 15, 17 },
	["Left_Rear"] = { 19, 21, 23, 25, 27, 29, 31, 33, 35, 37 },
	["Left_Corner"] = { 13, 15, 17, 19, 21, 23 },
	["Left_Alley"] = { 41 },
	["Right"] = { 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38 },
	["Right_Front"] = { 2, 4, 6, 8, 10, 12, 14, 16, 18 },
	["Right_Rear"] = { 20, 22, 24, 26, 28, 30, 32, 34, 36, 38 },
	["Right_Alley"] = { 42 },
	["Right_Corner"] = { 14, 16, 18, 20, 22, 24 },
}

COMPONENT.StateMap = "[B] 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 30 32 34 36 38 40 [R] 29 31 33 35 37 39 [A] 25 26 27 28 [W] 39 40 41 42"

COMPONENT.Segments = {
	All = {
		Frames = {
			[1] = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38",

			[2] = "1 2 3 4 33 34 35 36 37 38 Left_Corner Right_Corner",
			[3] = "1 2 3 4 33 34 35 36 37 38",
			[4] = "1 2 3 4 5 6 7 8 29 30 31 32 33 34 35 36 37 38",
			[5] = "5 6 7 8 29 30 31 32",
			[6] = "5 6 7 8 9 10 11 12 25 26 27 28 29 30 31 32",
			[7] = "9 10 11 12 25 26 27 28",
			[8] = "9 10 11 12 25 26 27 28 Left_Corner Right_Corner",
			[9] = "Left_Corner Right_Corner",
			--
			[10] = "1 2 3 4 33 34 35 36 37 38 Left_Corner Right_Corner",
			[11] = "Left_Corner Right_Corner",
			[12] = "9 10 11 12 25 26 27 28 Left_Corner Right_Corner",
			[13] = "9 10 11 12 25 26 27 28",
			[14] = "5 6 7 8 9 10 11 12 25 26 27 28 29 30 31 32",
			[15] = "5 6 7 8 29 30 31 32",
			[16] = "1 2 3 4 5 6 7 8 29 30 31 32 33 34 35 36 37 38",
			[17] = "1 2 3 4 33 34 35 36 37 38",
			
			[18] = "25 26 27 28",
			[19] = "29 30 31 32",

			[20] = "9 10 11 12 25 26 27 28",
			[21] = "5 6 7 8 29 30 31 32 Left_Corner Right_Corner",
		},
		Sequences = {
			["DEBUG"] = { 1 },

			["STAGE1"] = sequence():Alternate(18,19,10):SetTiming(1/30),
			["STAGE2"] = sequence():Alternate(20,21,10):SetTiming(1/30),
			["STAGE3"] = sequence()
				:Sequential(2,9):Do(4)
				:Add(2,0,3,0,4,0,5,0,6,0,7,0,8,0,9,0):Do(2)
				:Sequential(10,17):Do(4)
				:Add(10,0,11,0,12,0,13,0,14,0,15,0,16,0,17,0):Do(2)
				:SetTiming( 1/30 )
		}
	},
	TakedownAlleyFlash = {
		Frames = {
			[1] = "[W] 39 40 41 42",
			[2] = "[W] 39 41",
			[3] = "[W] 40 42",
		},
		Sequences = {
			["DEBUG"] = { 3 },

			["STAGE3"] = sequence()
			:Alternate(2,3,4):Do(4)
			:FlashHold(2,3,4):FlashHold(3,3,4):FlashHold(2,3,4):FlashHold(3,3,4)
			:SetTiming( 1/30 )
		}
	},
	Takedown = {
		Frames = {
			[1] = "[W] 39",
			[2] = "[W] 40",
			[3] = "[W] 39 40 43",
		},
		Sequences = {
			["ON"] = { 3 }
		}
	},
	Flood = {
		Frames = {
			[1] = "[W] Left_Front Right_Front 39 40 44"
		},
		Sequences = {
			["FLOOD"] = { 1 },
		}
	},
	Flood_Left = {
		Frames = {
			[1] = "[W] 41 @07 @09 45"
		},
		Sequences = {
			["FULL"] = { 1 },
		}
	},
	Flood_Right = {
		Frames = {
			[1] = "[W] 42 @08 @10 46"
		},
		Sequences = {
			["FULL"] = { 1 },
		}
	},
	Alley_Left = {
		Frames = {
			[1] = "[W] 41",
		},
		Sequences = {
			["OFF"] = { 0 },
			["ON"] = { 1 }
		}
	},
	Alley_Right = {
		Frames = {
			[1] = "[W] 42",
		},
		Sequences = {
			["OFF"] = { 0 },
			["ON"] = { 1 }
		}
	},
	Traffic = {
		Frames = {
			-- [0] = "[~R] @11 @13 @15 @17 [~B] @18 @16 @14 @12",
			[1] = "[A] @12",
			[2] = "[A] @12 @14",
			[3] = "[A] @12 @14 @16",
			[4] = "[A] @12 @14 @16 @18 @17",
			[5] = "[A] @12 @14 @16 @18 @17 @15",
			[6] = "[A] @12 @14 @16 @18 @17 @15 @13",
			[7] = "[A] @12 @14 @16 @18 @17 @13 @15 @11",
			[8] = "[A] @14 @16 @18 @17 @13 @15 @11",
			[9] = "[A] @16 @18 @17 @13 @15 @11",
			[10] = "[A] @18 @17 @15 @13 @11",
			[11] = "[A] @15 @13 @11",
			[12] = "[A] @13 @11",
			[13] = "[A] @11",
			[14] = "[A] @17 @18",
			[15] = "[A] @15 @17 @18 @16",
			[16] = "[A] @13 @15 @17 @18 @16 @14",
			[17] = "[A] @11 @13 @15 @17 @18 @16 @14 @12",
			[18] = "[A] @11 @13 @15 @16 @14 @12",
			[19] = "[A] @11 @13 @14 @12",
			[20] = "[A] @11 @12",
		},
		Sequences = {
			["LEFT"] = sequence():Sequential( 1, 13 ):Add( 0, 13, 0, 13, 0 ):StretchAll( 3 ),
			["RIGHT"] = sequence():Sequential( 13, 1 ):Add( 0, 1, 0, 1, 0 ):StretchAll( 3 ),
			["CENOUT"] = sequence():Sequential( 14, 20 ):Add( 0, 20, 0, 20, 0 ):StretchAll( 4 )
		}
	},
	Marker = {
		Frames = {
			[1] = "[B*0.75] @07 @09 @08 @10"
		},
		Sequences = {
			["CORNER"] = { 1 }
		}
	},
	Cut_Front = {
		Frames = {
			[1] = "[OFF] Left_Front Right_Front 39 40 43 44"
		},
		Sequences = {
			["ENABLED"] = { 1 }
		}
	},
	Cut_Rear = {
		Frames = {
			[1] = "[OFF] Left_Rear Right_Rear"
		},
		Sequences = {
			["ENABLED"] = { 1 }
		}
	}
}

COMPONENT.Inputs = {
	["Emergency.Warning"] = {
		["MODE1"] = { All = "STAGE1" },
		["MODE2"] = { All = "STAGE2" },
		["MODE3"] = { 
			All = "STAGE3",
			TakedownAlleyFlash = "STAGE3"
		}
	},
	["Emergency.SceneForward"] = {
		["ON"] = { Takedown = "ON" },
		["FLOOD"] = { Flood = "FLOOD" }
	},
	["Emergency.SceneLeft"] = {
		["ON"] = { Alley_Left = "ON" }
	},
	["Emergency.SceneRight"] = {
		["ON"] = { Alley_Right = "ON" }
	},
	["Emergency.Directional"] = {
		["LEFT"] = { Traffic = "LEFT" },
		["RIGHT"] = { Traffic = "RIGHT" },
		["CENOUT"] = { Traffic = "CENOUT" }
	},
	["Emergency.Marker"] = {
		["ON"] = { Marker = "CORNER" }
	},
	["Emergency.Cut"] = {
		["FRONT"] = { Cut_Front = "ENABLED" },
		["REAR"] = { Cut_Rear = "ENABLED" }
	}
}