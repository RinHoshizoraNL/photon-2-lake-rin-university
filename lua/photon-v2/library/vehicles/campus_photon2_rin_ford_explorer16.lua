if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2016 Ford Explorer Shirojo Campus Police"
VEHICLE.Vehicle		= "sm16fpiu"
VEHICLE.Category 	= "Photon 2: Lake Rin Shirojo Uni."
VEHICLE.Author		= "Rin Hoshizora"

VEHICLE.Siren = {
    [1] = {
		T1 = "whelen_epsilon/wail_alt",
		T2 = "whelen_epsilon/yelp_alt",
		T3 = "whelen_gamma_new/piercer",
		T4 = "whelen_gamma_new/hilo",
		AIR = "whelen_gamma_new/airhorn",
		MAN = "whelen_epsilon/wail_alt"
	}
}

VEHICLE.Equipment = {
	{
		Category = "Livery",
		Options = {
			{
				Option = "Black",
				SubMaterials = {
					{ Id = 15, Material = "rin/university/explorer16/police" }
				},
                BodyGroups = {
					{ BodyGroup = "pushbar", Value = 0 },
                    { BodyGroup = "rear seats", Value = 0 },
				},
            },
			{
				Option = "White",
				SubMaterials = {
					{ Id = 15, Material = "rin/university/explorer16/police_alt" }
				},
                BodyGroups = {
					{ BodyGroup = "pushbar", Value = 0 },
                    { BodyGroup = "rear seats", Value = 0 },
				},
            },
		}
	},
	{
		Category = "Wheels",
		Options = {
			{
				Option = "Hubcaps",
				BodyGroups = {
					{ BodyGroup = "wheels", Value = 1 },
				},
			},
			{
				Option = "Steelies",
				BodyGroups = {
					{ BodyGroup = "wheels", Value = 0 },
				},
			},
		}
	},
    {
		Category = "Spotlights",
		Options = {
			{
				Option = "PAR46 LED",
				Components = {
					{
						Component = "photon_whe_par46_left",
						Position = Vector( -39, 41, 62 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.1,
					},
					{
						Component = "photon_whe_par46_right",
						Position = Vector( 39, 41, 62 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.1,
					}
				},
			},
		}
	},
	{
		Category = "Lightbar",
		Options = {
			{
				Option = "Whelen Legacy",
				Components = {
					{
						Component = "photon_whe_legacy_48_lrupd",
						Position = Vector( 0, -12, 86 ),
						Angles = Angle( 1, 90, 0 ),
						Scale = 1.13,
						BodyGroups = {
							["takedown"] = 0,
							["alley"] = 0,
							["cable"] = 0,
							["clamps"] = 1,
							["feet"] = 1,
							["gels"] = 2
						},
						Bones = {
							["foot_low_left"]		=	{ Vector( 0, 0, 0), Angle( 0, 0, 0 ), 1 },
							["foot_low_right"]		=	{ Vector( 0, 0, 0), Angle( 0, 0, 0 ), 1 },
							["clamp_low_left"]		=	{ Vector( 0.5, 0, -0.035), Angle( 0, 0, 0 ), 1 },
							["clamp_low_right"]		=	{ Vector( -0.5, 0, -0.035), Angle( 0, 0, 0 ), 1 }
						},
						SubMaterials = {
							[3] = "rin/university/props/legacy_gels",
						}
					}
				}
			}
		}
	},
	{
		Category = "Siren",
		Options = {
			{
				Option = "Whelen",
				Components = {
					{
						Name = "@siren_speaker",
						Component = "siren_prototype_lrupd",
						Position = Vector(0, 120, 27.1),
						Angles = Angle(0, -90, 0),
						Scale = 0,
						Siren = 1,
						Templates = {
							["Sound"] = { 
								Tone = {
									DSP = 0,
									Pitch = 100
								}
							}
						}
					}
				}
			}
		}
	},
	{
		Category = "Police Equipment",
		Options = {
			{
				Option = "Police Equipment",
				BodyGroups = {
					{ BodyGroup = "bobblehead", Value = 6 },
				},
                Components = {
					{
						Component = "photon_pan_toughbookcf30",
						Position = Vector( 7.8, 21.5, 48 ),
						Angles = Angle( 0, 31, 0 ),
						Scale = 0.9,
						Options = {
							Pole = 0,
							Base = -60,
							Screen = "rin/lrpd2/props/laptop_screen_lrpd",
						},
						RenderGroup = RENDERGROUP_OPAQUE,
					},
				},
				Props = {
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -120.5, 50 ),
						Angles = Angle( -18, 270, 00 ),
						Scale = 1.02,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 118.8, 26.5 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1.06,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_front",
						},
					},
					{
						Model = "models/sentry/props/jp/oss_mkd1.mdl",
						Position = Vector( 0, 15, 36.5 ),
						Angles = Angle( -58, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( -0.2, 40, 58.85 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 17.5, 39 ),
						Angles = Angle( 0, 0, -58 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 8, 30, 75.2 ),
						Angles = Angle( 8, 264.8, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/schmal/antenna_data.mdl",
						Position = Vector( 0, -60, 84.9 ),
						Angles = Angle( 0, 0, 1.5 ),
						Scale = 1,
					},
                    {
						Model = "models/schmal/antenna_lojack.mdl",
						Position = Vector( 0, -30, 84.7 ),
						Angles = Angle( 0, 0, -1 ),
						Scale = 1,
					},
				}
			}
		}
	},
}