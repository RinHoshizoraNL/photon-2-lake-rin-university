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

VEHICLE.Siren = {
    [1] = {
		T1 = "whelen_gamma_new/wail",
		T2 = "whelen_gamma_new/yelp",
		T3 = "whelen_gamma_new/piercer",
		T4 = "whelen_gamma_new/hilo",
		AIR = "whelen_gamma_new/airhorn",
		MAN = "whelen_gamma_new/wail"
	}
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
		Category = "Standard",
		Options = {
			{
				Option = "Standard",
				Components = {
					{
						Component = "photon_standard_chevcap13",
						Segments = {
							["HighBeamsFlasherSCPD"] = {
								Frames = {
									[1] = "3 4",
									[2] = "3",
									[3] = "4",
									[4] = "[PASS] 3 4"
								},
								Sequences = {
									WIGWAG_SCPD = sequence():Add(2,2,2,2,2,0,0,2,2,2,2,2,0,0,3,3,3,3,3,0,0,3,3,3,3,3,0,0),
									CUT = { 4 }
								}
							},
							["RearSignalFlasherSCPD"] = {
								Off = "OFF",
								Frames = {
									[1] = "[B] 7",
									[2] = "[B] 8",
									[3] = "[B] 7 8",
									[4] = "[PASS] 7 8"
								},
								Sequences = {
									STAGE3 = sequence():QuadFlash( 1, 2 ),
									CUT = { 4 }
								}
							},
							["RearFlashersSCPD"] = {
								Off = "PASS",
								Frames = {
									[1] = "[~R] 9 10 [~SW] 12 13",
									[2] = "[~R] 9 10",
									[3] = "[~SW] 12 13",
									[4] = "[PASS] 9 10 12 13"
								},
								Sequences = {
									STAGE3 = sequence():Alternate( 2, 3, 4 ),
									CUT = { 4 }
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {},
								["MODE2"] = {},
								["MODE3"] = {
									HighBeamsFlasherSCPD = "WIGWAG_SCPD",
									RearSignalFlasherSCPD = "STAGE3",
									RearFlashersSCPD = "STAGE3"
								}
							},
							["Emergency.Cut"] = {
								["FRONT"] = { HighBeamsFlasherSCPD = "CUT" },
								["REAR"] = {
									RearSignalFlasherSCPD = "CUT",
									RearFlashersSCPD = "CUT"
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
				Option = "Whelen Liberty",
				Components = {
					{
						Component = "photon_whe_liberty_48_lrupd",
						Position = Vector( 0, -25, 70.19 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.82,
						StateMap = "[B] 3 4 5 6 7 8 9 10 14 16 [R] 15 13 [A] 11 12 [W] AlleyLeft AlleyRight TakedownLeft TakedownRight",
						Bones = {
							["foot_l"] = { Vector( -2.2, 0, -0.09), Angle( 0, 0, 0 ), 1 },
							["foot_r"] = { Vector( 2.2, 0, -0.09), Angle( 0, 0, 0 ), 1 },
							["strap_l"] = { Vector( -0.1, 0, 0), Angle( 0, 0, 0 ), 1 },
							["strap_r"] = { Vector( 0.1, 0, 0), Angle( 0, 0, 0 ), 1 },
						},
						BodyGroups = {
							["front_inner"] = 3,
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
						Name = "@grille_ion",
						Component = "photon_whe_ion_surface_bracket",
						Position = Vector( 9, 99, 33 ),
						Angles = Angle( 180, -8, 0 ),
						Scale = 0.75,
						States = { "B" },
						Segments = {
							LightSCPD = {
								Frames = {
									[1] = "Light"
								},
								Sequences = {
									["DEBUG"] = { 1 },

									["STAGE2"] = sequence():Add(1,1,1,1,1,1,1,1,0,0):AppendPhaseGap(),
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
								["MODE2"] = {
									LightSCPD = "STAGE2:180"
								},
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
						Position = Vector( -9, 99, 33 ),
						Angles = Angle( 180, 8, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE2"] = {
									LightSCPD = "STAGE2"
								},
								["MODE3"] = {
									LightSCPD = "STAGE3"
								}
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
						Name = "@rear_ion",
						Position = Vector( -12, -82.4, 54 ),
						Angles = Angle( 180, 0, 180 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									LightSCPD = "STAGE2:180"
								},
								["MODE2"] = {
									LightSCPD = "STAGE2:180"
								},
								["MODE3"] = {
									LightSCPD = "STAGE3:180"
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
						Position = Vector( 12, -82.4, 54 ),
						Angles = Angle( 180, 0, 180 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									LightSCPD = "STAGE2"
								},
								["MODE2"] = {
									LightSCPD = "STAGE2"
								},
								["MODE3"] = {
									LightSCPD = "STAGE3"
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
		Category = "Sides",
		Options = {
			{
				Option = "Whelen Ions",
				Components = {
					{
						Inherit = "@grille_ion",
						Name = "@side_ion",
						Component = "photon_whe_ion",
						Position = Vector( -40.55, 47, 37.7 ),
						Angles = Angle( 4.5, 88, 0 ),
						Segments = {
							LightSCPD = {
								Frames = {
									[1] = "Light"
								},
								Sequences = {
									["DEBUG"] = { 1 },

									["STAGE2"] = sequence():Add(1,1,1,1,1,1,1,1,0,0):AppendPhaseGap(),
									["STAGE3"] = sequence():QuintFlash(1,0)
								}
							}
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {},
								["MODE2"] = {
									LightSCPD = "STAGE2:180"
								},
								["MODE3"] = {
									LightSCPD = "STAGE3:180"
								}
							}
						}
					},
                    {
						Inherit = "@side_ion",
						Position = Vector( 40.55, 47, 37.7 ),
						Angles = Angle( -4.5, -88, 0 ),
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {},
								["MODE2"] = {
									LightSCPD = "STAGE2"
								},
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
		Category = "Spotlights",
		Options = {
			{
				Option = "Dual Spotlights",
				Components = {
					{
						Name = "@spotlight_left",
						Component = "photon_whe_par46_left",
						Position = Vector( -32, 27, 53 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
					{
						Name = "@spotlight_right",
						Component = "photon_whe_par46_right",
						Position = Vector( 32, 27, 53 ),
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
		Category = "Wheels",
		Options = {
			{
				Option = "Hubcaps",
				BodyGroups = {
					{ BodyGroup = "hubcaps", Value = 1 },
				}
			},
            {
				Option = "Steelies",
				BodyGroups = {
					{ BodyGroup = "hubcaps", Value = 0 },
				}
			}
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
					{
						Component = "photon_sos_observe",
						Position = Vector( 0, -7, 64.3),
						Angles = Angle( 2, 90, 180 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE
					}
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