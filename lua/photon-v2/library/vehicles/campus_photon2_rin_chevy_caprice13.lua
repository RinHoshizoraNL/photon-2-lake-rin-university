if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2013 Chevrolet Caprice Shirojo Campus Police"
VEHICLE.Vehicle		= "13caprice_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin Shirojo Uni."
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.SubMaterials = {
	[15] = "photon/common/blank"
}

VEHICLE.Equipment = {
	{
		Category = "Livery",
		Options = {
			{
				Option = "Black",
				SubMaterials = {
					{ Id = 13, Material = "rin/university/caprice13/police" }
				},
				BodyGroups = {
					{ BodyGroup = "model", Value = 1 },
				},
			},
			{
				Option = "White",
				SubMaterials = {
					{ Id = 13, Material = "rin/university/caprice13/police_alt" }
				},
				BodyGroups = {
					{ BodyGroup = "model", Value = 1 },
				},
			},
		}
	},
	{
		Category = "Siren",
		Options = {
			{
				Option = "Whelen Epsilon",
				Components = {
					{
						Name = "@siren",
						Component = "siren_prototype",
						Position = Vector(0, 120, 27.1),
						Angles = Angle(0, -90, 0),
						Scale = 0,
						Siren = "whelen_epsilon"
					},
				}
			},
		}
	},
    {
		Category = "Lightbar",
		Options = {
			{
				Option = "Whelen Liberty",
				Components = {
					{
						Component = "photon_whe_liberty_48_lrupd",
						Position = Vector( 0, -19, 70 ),
						Angles = Angle( 2.5, 90, 0 ),
						Scale = 0.8,
						BodyGroups = {
							["straps"] = 1,
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									"ALT"
								},
								["MODE2"] = {
									"ALT_B"
								},
								["MODE3"] = {
									"ALT_MASS"
								},
							},
						},
					},
				}
			},
		}
	},
    {
		Category = "Grille",
		Options = {
			{
				Option = "Whelen Ion",
				Components = {
					{
						Component = "photon_whe_ion_surface_bracket",
						Position = Vector( 9, 99, 33 ),
						Angles = Angle( 180, -8, 0 ),
						Scale = 1,
                        States = {
							[1] = "B",
						},
					},
                    {
						Component = "photon_whe_ion_surface_bracket",
						Position = Vector( -9, 99, 33 ),
						Angles = Angle( 180, 8, 0 ),
						Scale = 1,
                        States = {
							[1] = "B",
						},
                        Phase = 90,
					},
				}
			}
		}
	},
	{
		Category = "Rear Deck",
		Options = {
			{
				Option = "Whelen Ion",
				Components = {
					{
						Component = "photon_whe_ion_surface_bracket",
						Position = Vector( 12, -82, 54.8 ),
						Angles = Angle( 180, 0, 180 ),
						Scale = 1,
                        States = {
							[1] = "B",
						},
						RenderGroup = RENDERGROUP_OPAQUE,
					},
                    {
						Component = "photon_whe_ion_surface_bracket",
						Position = Vector( -12, -82, 54.8 ),
						Angles = Angle( 180, 0, 180 ),
						Scale = 1,
                        States = {
							[1] = "B",
						},
                        Phase = 90,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
				}
			}
		}
	},
	{
		Category = "Sides",
		Options = {
			{
				Option = "Whelen Ions",
				Components = {
					{
						Component = "photon_whe_ion",
						Position = Vector( 40.4, 46, 37.8 ),
						Angles = Angle( -4.5, -88, 0 ),
						Scale = 1,
                        States = {
							[1] = "B",
						},
						Phase = 90,
					},
                    {
						Component = "photon_whe_ion",
						Position = Vector( -40.4, 46, 37.8 ),
						Angles = Angle( 4.5, 88, 0 ),
						Scale = 1,
                        States = {
							[1] = "B",
						},
                    },
				}
			}
		}
	},
    {
		Category = "Spotlights",
		Options = {
			{
				Option = "Pillar Spotlights",
				Components = {
					{
						Component = "photon_whe_par46_left",
						Position = Vector( -32, 27, 53 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
					{
						Component = "photon_whe_par46_right",
						Position = Vector( 32, 27, 53 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						Inputs = {
							-- Clear the default illumination mode
							["Emergency.SceneForward"] = { ["ON"] = {} },
						}
					}
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
					{ BodyGroup = "hubcaps", Value = 1 },
				},
			},
            {
				Option = "Steelies",
				BodyGroups = {
					{ BodyGroup = "hubcaps", Value = 0 },
				},
			},
		}
	},
	{
		Category = "Spotlight",
		Options = {
			{
				Option = "Pillar Spotlight",
				Components = {
					{
						Component = "photon_whe_par46_left",
						Position = Vector( -32, 27, 53 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
				},
			},
		}
	},
	{
		Category = "Police Equipment",
		Options = {
			{
				Option = "Police Equipment",
				Components = {
					{
						Component = "photon_pan_toughbookcf30",
						Position = Vector( 8, 13, 45 ),
						Angles = Angle( 0, 31, 0 ),
						Scale = 0.9,
						Options = {
							Pole = 0,
							Base = -60,
							-- You can change the screen material by using this option:
							Screen = "rin/lrpd2/props/laptop_screen_lrpd",
						},
						RenderGroup = RENDERGROUP_OPAQUE,
					},
				},
				Props = {
					{
						Model = "models/sentry/props/jp/oss_mkd1.mdl",
						Position = Vector( 1.5, 8.1, 30.5 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( 1.5, 10.8, 31.8 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 1.5, 5.4, 30 ),
						Angles = Angle( 0, 0, -69 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 7, 14.5, 62 ),
						Angles = Angle( 8, 264.8, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
				    {
						Model = "models/sentry/props/procopper_cvpi.mdl",
						Position = Vector( 1.5, -2, 4 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/setina_partition_cvpi.mdl",
						Position = Vector( 1, 1, 1 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/schmal/antenna_data.mdl",
						Position = Vector( 0, -102, 52 ),
						Angles = Angle( 0, 0, 2 ),
						Scale = 1,
					},
                    {
						Model = "models/schmal/antenna_lojack.mdl",
						Position = Vector( 0, -40, 68.3 ),
						Angles = Angle( 0, 0, 4.5 ),
						Scale = 1,
					},
                    {
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -120.5, 26 ),
						Angles = Angle( -2, -90, 0 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 109.9, 18.9 ),
						Angles = Angle( -0.7, 90, 0 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_front",
						},
					},
				}
			}
		}
	},
	{
		Category = "Windows",
		Options = {
			{
				Option = "Window",
				Props = {
					{
						Model = "models/schmal/chevcap13_windows.mdl",
						Position = Vector( 0, 0, 0 ),
						Angles = Angle( 0, -90, 0 ),
						Scale = 1,
						SubMaterials = {
							[0] = "schmal/chevcap13/police_modulate"
						}
					}
				}
			},
		}
	},
}