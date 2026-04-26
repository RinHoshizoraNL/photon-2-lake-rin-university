if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "1987 Ford Crown Victoria Shirojo Campus Police"
VEHICLE.Vehicle		= "87ltd_sgm"
VEHICLE.Category 	= "Photon 2: Lake Rin Shirojo Uni."
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.Equipment = {
     {
		Category = "Livery",
		Options = {
			{
				Option = "Blue",
				SubMaterials = {
					{ Id = 7, Material = "rin/university/crownvic87/police" },
				},
			},
		}
	},
    {
		Category = "Siren",
		Options = {
			{
				Option = "FS Omega90",
				Components = {
					{
						Name = "@siren",
						Component = "siren_prototype",
						Position = Vector(0, 120, 27.1),
						Angles = Angle(0, -90, 0),
						Scale = 0,
						Siren = "fedsig_omega90"
					},
				}
			},
		}
	},
    {
		Category = "Lightbar",
		Options = {
			{
				Option = "Federal Signal Jetstream",
				Components = {
					{
						Component = "fedsig_aerodynic",
						Position = Vector( 0, -19.5, 59.5 ),
						Angles = Angle( 0, 180, 0 ),
						Scale = 0.97,
						States = {
							[1] = "B",
							[2] = "B",
							[3] = "B",
							[4] = "B",
							[5] = "B",
							[6] = "B",
							[7] = "B",
							[8] = "B",
							[9] = "B",
							[10] = "B",
						},
						SubMaterials = {
							[2] = "schmal/photon/fedsig_legend/dome_r",
						},
					},
				}
			},
		}
	},
    {
		Category = "Spotlights",
		Options = {
			{
				Option = "Spotlights",
				Components = {
					{
						Component = "photon_par46_left",
						Position = Vector( -38, 25, 42 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						SubMaterials = {
							[5] = "sentry/shared/env_cubemap_model"
						}
					},
					{
						Component = "photon_par46_right",
						Position = Vector( 38, 25, 42 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						SubMaterials = {
							[5] = "sentry/shared/env_cubemap_model"
						},
						Inputs = {
							-- Clear the default illumination mode
							["Emergency.SceneForward"] = { ["ON"] = {} },
						}
					}
				}
				
			},
		}
	},
	{
		Category = "Police Equipment",
		Options = {
			{
				Option = "Police Equipment",
				Props = {
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( 1.5, 24, 43.65 ),
						Angles = Angle( -1, 270, -0.2 ),
						Scale = 1.1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/sap500.mdl",
						Position = Vector( 0, 26, 31.35 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1.3,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( 0, -35, 61.6),
						Angles = Angle( 0, 0, 1.5 ),
						Scale = 1
					},
					{
						Model = "models/supermighty/photon/dashcam.mdl",
						Position = Vector( 7.5, 15, 52.2),
						Angles = Angle( 0, 270, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/sentry/props/setina_partition_cvpi.mdl",
						Position = Vector( 0, 0, -5),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						RenderGroup = RENDERGROUP_OPAQUE,
					},
					{
						Model = "models/supermighty/photon/front_holder.mdl",
						Position = Vector( -34, 111.2, 16.8 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 1
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( 0, -123, 30 ),
						Angles = Angle( -16, 270, 0 ),
						Scale = 1,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_rear",
						},
					},
					{
						Model = "models/xenosprops/na_plate/na_plate_gov.mdl",
						Position = Vector( -34, 112, 16.8 ),
						Angles = Angle( 0, 90, 0 ),
						Scale = 0.99,
						SubMaterials = {
							[1] = "rin/university/props/plate_uni_front",
						},
					},
				}
			}
		}
	},
}
