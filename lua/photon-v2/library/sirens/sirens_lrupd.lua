-- This tone is apart of default PH2 but for some reason is not included in sirens_default.lua
Photon2.RegisterSiren(
	{
		Name = "whelen_295hfsa6_lrupd_horn",
		Make = "Whelen",
		Model = "295HSFA6",
		Author = "Schmal",
		Sounds = {
			["HORN"] = { Sound = "photon/sirens/whelen_295hfsa6/horn.wav", 	Default = "AIR", Label = "AIR" }
		}
	}
)