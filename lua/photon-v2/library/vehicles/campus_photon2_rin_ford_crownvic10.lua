if (Photon2.ReloadVehicleFile()) then return end --rin
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2010 Ford Crown Victoria Shirojo Campus Police"
VEHICLE.Vehicle		= "cvpi_hd_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin Shirojo Uni."
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.Siren = {
    [1] = {
		T1 = "whelen_295hfsa6/wail",
		T2 = "whelen_295hfsa6/yelp",
		T3 = "whelen_295hfsa6/piercer",
		T4 = "whelen_295hfsa6/hilo",
		AIR = "whelen_295hfsa6_lrupd_horn/horn",
		MAN = "whelen_295hfsa6/wail"
	}
}

VEHICLE.Equipment = {
	{
		Category = "Livery",
		Options = {
			{
				Option = "Black",
				SubMaterials = {
					{ Id = 3, Material = "rin/university/crownvic10/police" }
				},
			},
			{
				Option = "White",
				SubMaterials = {
					{ Id = 3, Material = "rin/university/crownvic10/police_alt" }
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
						},
						Inputs = { 
							["Emergency.SirenParkKill"] = { ["PARK"] = {} }
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
				Option = "Hubcaps",
				BodyGroups = {
					{ BodyGroup = "hubcaps", Value = 0 },
				},
			},
			{
				Option = "Steelies",
				BodyGroups = {
					{ BodyGroup = "hubcaps", Value = 1 },
				},
			},
            {
				Option = "Steelies missing center caps",
				BodyGroups = {
					{ BodyGroup = "hubcaps", Value = 2 },
				},
			},
		}
	},
	{
		Category = "Rain Guards",
		Options = {
			{
				Option = "Rain Guards",
				BodyGroups = {
					{ BodyGroup = "rainguards", Value = 1 },
				},
			},
			{
				Option = "None",
				BodyGroups = {
					{ BodyGroup = "rainguards", Value = 0 },
				},
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
						Position = Vector( 0, -20, 68.65 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.84,
						StateMap = "[B] 3 4 5 6 7 8 9 10 14 16 [R] 15 13 [A] 11 12 [W] AlleyLeft AlleyRight TakedownLeft TakedownRight",
						Bones = {
							["foot_l"] = { Vector( -1.2, 0, -0.09), Angle( 0, 0, 0 ), 1 },
							["foot_r"] = { Vector( 1.2, 0, -0.09), Angle( 0, 0, 0 ), 1 },
							["strap_l"] = { Vector( -3, 0, 0.4), Angle( 0, 0, 0 ), 1 },
							["strap_r"] = { Vector( 3, 0, 0.4), Angle( 0, 0, 0 ), 1 },
						},
						BodyGroups = {
							["front_inner"] = 1,
							["front_middle"] = 0,
							["front_outer"] = 0,
							["rear_outer"] = 0,
							["rear_inner"] = 0
						},
						Segments = {
							Marker = {
								Frames = {
									[1] = "[B*0.75] 7 8 9 10",
								}
							},
							SCPDMain = {
								Frames = {
									[1] = "3 4 5 6 7 8 9 10 11 12 13 14 15 16 AlleyLeft AlleyRight TakedownLeft TakedownRight",
									
									-- STAGE 3 --
									[2] = "15 16 7 8 9 10 TakedownLeft TakedownRight",
									[3] = "15 16 TakedownLeft TakedownRight",
									[4] = "15 16 13 14 3 4 TakedownLeft TakedownRight AlleyLeft AlleyRight",
									[5] = "13 14 3 4 AlleyLeft AlleyRight",
									[6] = "11 12 13 14 3 4 5 6 AlleyLeft AlleyRight",
									[7] = "11 12 5 6",
									[8] = "11 12 5 6 7 8 9 10",
									[9] = "7 8 9 10",
								},
								Sequences = {
									["DEBUG"] = { 1 },
									["STAGE3"] = sequence()
										:Add(2,2,3,4,4,5,6,6,7,8,8,9):Do(4)
										:Add(2,0,0,3,0,0,4,0,0,5,0,0,6,0,0,7,0,0,8,0,0,9,0,0):Do(2)
										:SetTiming( 1/30 )
								}
							},
							SCPDFront = {
								Frames = {
									[1] = "3 4 5 6",
									
									[2] = "3 5",
									[3] = "4 6",
								},
								Sequences = {
									["DEBUG"] = { 1 },
									["ON"] = sequence():Add(2,2,2,2,2,2,2,2,0,0,3,3,3,3,3,3,3,3,0,0)
								}
							},
							SCPDRear = {
								Frames = {
									[1] = "11 12 13 14",

									[2] = "11 14",
									[3] = "12 13"
								},
								Sequences = {
									["DEBUG"] = { 1 },
									["ON"] = sequence():Add(2,2,2,2,2,2,2,2,0,0,3,3,3,3,3,3,3,3,0,0)
								}
							},
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = { 
									SCPDRear = "ON"
								},
								["MODE2"] = {
									SCPDFront = "ON",
									SCPDRear = "ON"
								},
								["MODE3"] = {
									SCPDMain = "STAGE3"
								}
							}
						}
					}
				}
			}
		}
	},
    {
		Category = "Grille Ions Setup",
		Options = {
			{
				Option = "Option #1",
				Components = {
					{
						Name = "@grille_ion",
						Component = "photon_whe_ion_surface_bracket",
						Position = Vector( 11, 108, 27.5 ),
						Angles = Angle( 0, -8, 0 ),
						Scale = 0.75,
						States = { "B" },
						Segments = {
							LightSCPD = {
								Frames = {
									[1] = "Light"
								},
								Sequences = {
									["DEBUG"] = { 1 },

									["STAGE3"] = sequence():FlashHold(1,2,5):AppendPhaseGap():SetTiming(1/30)
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
								["MODE2"] = {},
								["MODE3"] = {
									LightSCPD = "STAGE3"
								}
							},
							["Emergency.Cut"] = {
								["FRONT"] = { LightCutSCPD = "CUT" },
								["REAR"] = {}
							}
						}
					},
                    {
						Inherit = "@grille_ion",
						Position = Vector( -11, 108, 27.5 ),
						Angles = Angle( 0, 8, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = {
									LightSCPD = "STAGE3"
								}
							}
						}
					}
				}
			},
			{
				Option = "Option #2",
				Components = {
					{
						Inherit = "@grille_ion",
						Name = "@grille_ion_op2",
						Segments = {
							LightSCPD = {
								Frames = {
									[1] = "Light"
								},
								Sequences = {
									["DEBUG"] = { 1 },

									["STAGE3"] = sequence():QuintFlash(1,0):SetTiming(1/30)
								}
							}
						}
					},
                    {
						Inherit = "@grille_ion_op2",
						Position = Vector( -11, 108, 27.5 ),
						Angles = Angle( 0, 8, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = {
									LightSCPD = "STAGE3:180"
								}
							}
						}
					}
				}
			}
		}
	},
	{
		Category = "Rear Setup",
		Options = {
			{
				Option = "Option #1",
				Components = {
					{
						Name = "@standard_cvpi10",
						Component = "photon_standard_cvpi10",
						Segments = {
							["Headlight_flashers"] = {
								Frames = {
									[4] = "[PASS] 1 21 19 9 11 30 2 22 20 10 12 31"
								},
								Sequences = {
									STAGE3 = sequence():Alternate(1,2,6),
									CUT = { 4 }
								}
							},
							["Rear_flashers_SCPD"] = {
								Off = "OFF",
								Frames = {
									[1] = "15:~RI 16:~RI",
									[2] = "[W] 17 18",
									[3] = "[PASS] 15 16 17 18"
								},
								Sequences = {
									STAGE3 = sequence():QuintFlash(2,1),
									CUT = { 3 }
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = { 
									Headlight_flashers = "STAGE3",
									Rear_flashers_SCPD = "STAGE3"
								}
							},
							["Emergency.Cut"] = {
								["FRONT"] = { Headlight_flashers = "CUT" },
								["REAR"] = { Rear_flashers_SCPD = "CUT" }
							}
						}
					}
				}
			},
			{
				Option = "Option #2",
				Components = {
					{
						Inherit = "@standard_cvpi10",
						Segments = {
							["Headlight_flashers"] = {
								Sequences = {
									STAGE3 = sequence():Alternate(1,2,6)
								}
							},
							["Rear_flashers_SCPD"] = {
								Off = "OFF",
								Frames = {
									[1] = "15:~RI [W] 18",
									[2] = "16:~RI [W] 17",
								},
								Sequences = {
									STAGE3 = sequence():FlashHold(1,2,5):FlashHold(2,2,5):SetTiming(1/30)
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = { 
									Headlight_flashers = "STAGE3",
									Rear_flashers_SCPD = "STAGE3"
								}
							}
						}
					},
					{
						Inherit = "@grille_ion",
						Name = "@rear_ion",
						Position = Vector( -8.5, -82, 50.3 ),
						Angles = Angle( 0, 180-3, 0 ),
						States = { "B" },
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = {
									LightSCPD = "STAGE3"
								}
							},
							["Emergency.Cut"] = {
								["FRONT"] = {},
								["REAR"] = { LightCutSCPD = "CUT" }
							}
						},
						RenderGroup = RENDERGROUP_OPAQUE
					},
					{
						Inherit = "@rear_ion",
						Position = Vector( 8.5, -82, 50.3 ),
						Angles = Angle( 0, 180+3, 0 ),
						States = { "R" },
						Inputs = {
							["Emergency.Warning"] = {
								["MODE3"] = {
									LightSCPD = "STAGE3:180"
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
						Component = "photon_par46_left",
						Position = Vector( -35.06, 26.46, 49.282 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
                    {
						Name = "@spotlight_right",
						Component = "photon_par46_right",
						Position = Vector( 35.06, 26.46, 49.282 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
				},
				BodyGroups = {
					{ BodyGroup = "door_l_notch", Value = 0 },
					{ BodyGroup = "door_r_notch", Value = 0 }
				}
			},
			{
				Option = "Single Spotlight",
				Components = {
					{
						Inherit = "@spotlight_left"
					}
				},
				BodyGroups = {
					{ BodyGroup = "door_l_notch", Value = 0 },
					{ BodyGroup = "door_r_notch", Value = 1 }
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
					{ BodyGroup = "rearfascia", Value = 1 },
					{ BodyGroup = "spotlight_l", Value = 1 },
					{ BodyGroup = "spotlight_r", Value = 1 },
					{ BodyGroup = "windowbars", Value = 1 },
					{ BodyGroup = "grille", Value = 0 },
					{ BodyGroup = "pushbar", Value = 0 },
                    { BodyGroup = "doortrim", Value = 5 },
					{ BodyGroup = "reartrim", Value = 0 },
					{ BodyGroup = "handles", Value = 0 },
					{ BodyGroup = "trunkmodel", Value = 0 },
					{ BodyGroup = "trunkemblem", Value = 1 },
					{ BodyGroup = "mirrors", Value = 0 },
					{ BodyGroup = "bumperf_chrome", Value = 0 },
					{ BodyGroup = "bumperr_chrome", Value = 0 },
				},
				Components = {
					{
						Component = "photon_pan_toughbookcf30",
						Position = Vector( 6.5, 13.5, 40 ),
						Angles = Angle( 0, 31, 0 ),
						Scale = 1,
						Options = {
							Pole = 2,
							Base = -60,
							Screen = "rin/lrpd2/props/laptop_screen_lrpd",
						},
						RenderGroup = RENDERGROUP_OPAQUE,
					}
				},
				Props = {
					{
						Model = "models/sentry/props/jp/oss_mkd1.mdl",
						Position = Vector( -0.2, 10, 26.85 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( -0.2, 12.75, 28 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 7.4, 26.2 ),
						Angles = Angle( 0, 0, -69 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 7, 15, 62 ),
						Angles = Angle( 8, 264.8, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/schmal/antenna_data.mdl",
						Position = Vector( 0, -105, 48 ),
						Angles = Angle( 0, 0, 5 ),
						Scale = 1,
					},
                    {
						Model = "models/schmal/antenna_lojack.mdl",
						Position = Vector( 0, -40, 67.6 ),
						Angles = Angle( 0, 0, 3 ),
						Scale = 1,
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -124.55, 36.2 ),
						Angles = Angle( -11, 270, 00 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, 118.8, 18.2 ),
						Angles = Angle( 6.5, 90, 0 ),
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