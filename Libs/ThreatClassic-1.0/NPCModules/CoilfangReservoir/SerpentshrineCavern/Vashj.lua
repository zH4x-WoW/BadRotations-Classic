local MAJOR_VERSION = "ThreatClassicBR-1.0"
local MINOR_VERSION = 4

if _G.ThreatLib_MINOR_VERSION == nil then _G.ThreatLib_MINOR_VERSION = 0 end
if MINOR_VERSION > _G.ThreatLib_MINOR_VERSION then _G.ThreatLib_MINOR_VERSION = MINOR_VERSION end

local lib, oldminor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then
    return
end

ThreatLib_funcs[#ThreatLib_funcs + 1] = function()

	local ThreatLib = _G.ThreatLib
	local VASHJ_ID = 21212
	local BARRIER_ID = 38112

	ThreatLib:GetModule("NPCCore"):RegisterModule(VASHJ_ID, function(Vashj)
		function Vashj:Init()
			self.buffGains[BARRIER_ID] = self.Phase
			self.buffFades[BARRIER_ID] = self.Phase
			self:RegisterCombatant(VASHJ_ID, true)
		end

		function Vashj:Phase()
			self:WipeRaidThreatOnMob(VASHJ_ID)
		end
	end)
end
