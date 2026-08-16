if (Photon2.ReloadVehicleFile()) then return end --rin
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2015 Dodge Charger Shirojo Campus Police"
VEHICLE.Vehicle		= "15charger_fm2_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin Shirojo Uni."
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

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
					{ Id = 4, Material = "rin/university/charger15/police" }
				},
				BodyGroups = {
					{ BodyGroup = "pushbar", Value = 0 }
				},
			},
			{
				Option = "Black (Breast Cancer Awareness)",
				SubMaterials = {
					{ Id = 4, Material = "rin/university/charger15/police_pink" }
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
		Category = "Wheels",
		Options = {
			{
				Option = "Hubcaps (AWD)",
				BodyGroups = {
					["wheels_front"] = 4,
					["wheels_rear"] = 4
				}
			},
			{
				Option = "Hubcaps (RWD)",
				BodyGroups = {
					["wheels_front"] = 1,
					["wheels_rear"] = 1
				}
			},
			{
				Option = "Steelies (AWD)",
				BodyGroups = {
					["wheels_front"] = 3,
					["wheels_rear"] = 3
				}
			},
			{
				Option = "Steelies (RWD)",
				BodyGroups = {
					["wheels_front"] = 0,
					["wheels_rear"] = 0
				}
			}
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
							WigWag = {
								Frames = {
									[3] = "[PASS] 1 2",
								},
								Sequences = {
									["CUT"] = { 3 },
								}
							},
							TailFlasherSCPD = {
								Frames = {
									[1] = "10 13 14 15 16",

									[2] = "10 15 16",
									[3] = "13 14",

									[4] = "10 13 14 15 16",
								},
								Sequences = {
									["OFF"] = { 0 },
									["CUT"] = { 4 },

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
							},
							["Emergency.Cut"] = {
								["FRONT"] = {
									WigWag = "CUT"
								},
								["REAR"] = {
									TailFlasherSCPD = "CUT"
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
						Position = Vector( 0, -18, 75.3 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.99,
						BodyGroups = {
							["takedown"] = 0,
							["alley"] = 0,
							["cable"] = 0,
							["clamps"] = 0,
							["feet"] = 0,
							["gels"] = 2
						},
						Bones = {
							["foot_norm_left"]		=	{ Vector( -0.5, 0, 0), Angle( 0, 0, 0 ), 1 },
							["foot_norm_right"]		=	{ Vector( 0.5, 0, 0), Angle( 0, 0, 0 ), 1 },
							["clamp_norm_left"]		=	{ Vector( 0.85, 0, -0.08), Angle( 0, 0, 0 ), 1 },
							["clamp_norm_right"]		=	{ Vector( -0.85, 0, -0.08), Angle( 0, 0, 0 ), 1 }
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
									["OFF"] = { 0 },

									["STAGE1"] = sequence():Alternate(1,0,10):SetTiming(1/30),
									["STAGE3"] = sequence():FlashHold(1,2,4):AppendPhaseGap():SetTiming(1/30)
								}
							},
							LightCutSCPD = {
								Frames = {
									[1] = "[OFF] Light"
								},
								Sequences = {
									["CUT"] = { 1 }
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {},
								["MODE2"] = { LightSCPD = "STAGE1" },
								["MODE3"] = { LightSCPD = "STAGE3" }
							},
							["Emergency.Cut"] = {
								["FRONT"] = { LightCutSCPD = "CUT" },
								["REAR"] = {}
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
							},
							whelen_vertex_cut_SCPD = {
								Frames = {
									[1] = "[OFF] 1 2 3"
								},
								Sequences = {
									["CUT"] = { 1 },
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {},
								["MODE2"] = { whelen_vertex_SCPD = "STAGE1:180" },
								["MODE3"] = { whelen_vertex_SCPD = "STAGE3" }
							},
							["Emergency.Cut"] = {
								["FRONT"] = { whelen_vertex_cut_SCPD = "CUT" },
								["REAR"] = {}
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
						Position = Vector( 12, -85, 57.42 ),
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
							},
							["Emergency.Cut"] = {
								["FRONT"] = {},
								["REAR"] = { LightCutSCPD = "CUT" }
							}
						},
						RenderGroup = RENDERGROUP_OPAQUE
					},
                    {
						Inherit = "@rear_deck_ion",
						Position = Vector( -12, -85, 57.42 ),
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
				Option = "Dual Spotlights",
				Components = {
					{
						Name = "@spotlight_left",
						Component = "photon_whe_par46_left",
						Position = Vector( -34.5, 28, 58 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
					{
						Name = "@spotlight_right",
						Component = "photon_whe_par46_right",
						Position = Vector( 34.5, 28, 58 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						Inputs = {
							-- Clear the default illumination mode
							["Emergency.SceneForward"] = { ["ON"] = {} },
						}
					}
				}
			},
			{
				Option = "Single Spotlight",
				Components = {
					{
						Inherit = "@spotlight_left"
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
					{
						Component = "photon_sos_observe",
						Position = Vector( 0, -5, 71.5 ),
						Angles = Angle( 11, 90, 180 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE
					}
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