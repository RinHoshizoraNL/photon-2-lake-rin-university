if (Photon2.ReloadVehicleFile()) then return end --rin
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2015 Dodge Charger Shirojo Campus Police"
VEHICLE.Vehicle		= "15charger_fm2_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin Shirojo Uni."
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.Equipment = {
	{
		Category = "Livery",
		Options = {
			{
				Option = "Black",
				SubMaterials = {
					{ Id = 4, Material = "rin/university/charger15/police" }
				},
				BodyGroups = {
					{ BodyGroup = "pushbar", Value = 0 }
				},
			},
			{
				Option = "White",
				SubMaterials = {
					{ Id = 4, Material = "rin/university/charger15/police_alt" }
				},
				BodyGroups = {
					{ BodyGroup = "pushbar", Value = 0 }
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
						Siren = "whelen_gamma_new"
					},
				}
			},
		}
	},
	{
		Category = "Wheels",
		Options = {
			{
				Option = "AWD Hubcaps",
				BodyGroups = {
					{ BodyGroup = "wheels_front", Value = 4 },
					{ BodyGroup = "wheels_rear", Value = 4 },
				},
			},
            {
				Option = "RWD Hubcaps",
				BodyGroups = {
					{ BodyGroup = "wheels_front", Value = 1 },
					{ BodyGroup = "wheels_rear", Value = 1 },
				},
			},
		}
	},
	{
		Category = "Standard",
		Options = {
			{
				Option = "Standard",
				Components = {
					{
						Component = "photon_standard_sgmchar15",
						Segments = {
							TailFlasherSCPD = {
								Frames = {
									[1] = "10 13 14 15 16",

									[2] = "10 15 16",
									[3] = "13 14",
								},
								Sequences = {
									["OFF"] = { 0 },

									["STAGE3"] = sequence():QuadFlash(2,3)
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE2"] = {},
								["MODE3"] = {
									WigWag = "WIGWAG",
									TailFlasherSCPD = "STAGE3"
								}
							}
						}
					}
				}
			}
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
						Position = Vector( 0, -18, 75 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.99,
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
							["clamp_low_left"]		=	{ Vector( 0.8, 0, -0.035), Angle( 0, 0, 0 ), 1 },
							["clamp_low_right"]		=	{ Vector( -0.8, 0, -0.035), Angle( 0, 0, 0 ), 1 }
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
		Category = "Front Lighting Setup",
		Options = {
			{
				Option = "Setup #1",
				Components = {
					{
						Name = "@grille_ion",
						Component = "photon_whe_ion",
						Position = Vector( 12, 112.4, 36.6 ),
						Angles = Angle( -0.5, -8, 0 ),
						Scale = 0.75,
                        States = { "B" },
						Segments = {
							LightSCPD = {
								Frames = {
									[1] = "Light"
								},
								Sequences = {
									["DEBUG"] = { 1 },

									["STAGE1"] = sequence():Alternate(1,0,10):SetTiming(1/30),
									["STAGE3"] = sequence():FlashHold(1,2,4):AppendPhaseGap():SetTiming(1/30)
								}
							},
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {},
								["MODE2"] = { LightSCPD = "STAGE1" },
								["MODE3"] = { LightSCPD = "STAGE3" }
							}
						}
					},
                    {
						Inherit = "@grille_ion",
						Position = Vector( -12, 112.4, 36.6 ),
						Angles = Angle( 0.5, 8, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = { LightSCPD = "STAGE3:180" }
							}
						}
					},
					{
						Name = "@front_lower_vertex",
						Component = "lr_anemolis_whelen_vertex",
						Position = Vector( -23.5, 115, 19 ),
						Angles = Angle( -90-16, -55, 0 ),
						Scale = 1,
						States = {
							[1] = "B",
							[2] = "W"
						},
						Segments = {
							whelen_vertex_SCPD = {
								Frames = {
									[1] = "2",
									[2] = "3"
								},
								Sequences = {
									["STAGE1"] = sequence():Alternate(1,2,10):SetTiming(1/30),
									["STAGE3"] = sequence():FlashHold(1,2,4):FlashHold(2,2,4):SetTiming(1/30)
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {},
								["MODE2"] = { whelen_vertex_SCPD = "STAGE1:180" },
								["MODE3"] = { whelen_vertex_SCPD = "STAGE3" }
							}
						}
					},
					{
						Inherit = "@front_lower_vertex",
						Position = Vector( 23.5, 115, 19 ),
						Angles = Angle( 90+16, 55, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = { whelen_vertex_SCPD = "STAGE3:180" }
							}
						}
					}
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
						Inherit = "@grille_ion",
						Name = "@rear_deck_ion",
						Component = "photon_whe_ion_surface_bracket",
						Position = Vector( 12, -85, 57.8 ),
						Angles = Angle( 180, 0, 180 ),
						States = {
							[1] = "B",
						},
						Segments = {
							LightSCPD = {
								Sequences = {
									["STAGE3ALT"] = sequence():Alternate(1,0,3):SetTiming(1/30)
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = { LightSCPD = "STAGE1" },
								["MODE2"] = { LightSCPD = "STAGE1" },
								["MODE3"] = { LightSCPD = "STAGE3ALT" }
							}
						},
						RenderGroup = RENDERGROUP_OPAQUE
					},
                    {
						Inherit = "@rear_deck_ion",
						Position = Vector( -12, -85, 57.8 ),
						Angles = Angle( 180, 0, 180 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = {
									LightSCPD = "STAGE3ALT"
								}
							}
						},
						RenderGroup = RENDERGROUP_OPAQUE
					}
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
						Position = Vector( -34.5, 28, 58 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
					{
						Component = "photon_whe_par46_right",
						Position = Vector( 34.5, 28, 58 ),
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
		Category = "Police Equipment",
		Options = {
			{
				Option = "Police Equipment",
				BodyGroups = {
					{ BodyGroup = "badge", Value = 2 },
				},
				Components = {
					{
						Component = "photon_pan_toughbookcf30",
						Position = Vector( 6.5, 12, 45 ),
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
						Position = Vector( -0.2, 8.1, 30.5 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( -0.2, 10.8, 31.8 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 5.4, 30 ),
						Angles = Angle( 0, 0, -69 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 7, 20, 68 ),
						Angles = Angle( 8, 264.8, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/procopper_cvpi.mdl",
						Position = Vector( 0, -2, 4 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/setina_partition_cvpi.mdl",
						Position = Vector( 0, 0, 4.5 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/supermighty/photon/2015_charger_window_bars.mdl",
						Position = Vector( 0, -37, 58.5 ),
						Angles = Angle( 0, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -126.7, 30 ),
						Angles = Angle( -10, -90, 0 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_rear",
						},
					},
                    {
						Model = "models/schmal/antenna_data.mdl",
						Position = Vector( 0, -110, 55.5 ),
						Angles = Angle( 0, 0, 5 ),
						Scale = 1,
					},
                    {
						Model = "models/schmal/antenna_lojack.mdl",
						Position = Vector( 0, -40, 73.2 ),
						Angles = Angle( 0, 0, 5 ),
						Scale = 1,
					},
					{
						Model = "models/supermighty/photon/front_holder.mdl",
						Position = Vector( 0, 118.2, 23 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 118.9, 23 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.97,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_front",
						},
					},
				}
			}
		}
	},
}