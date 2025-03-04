--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("custom_weapon");

ITEM.name = "ItemCrowbar";
ITEM.uniqueID = "crowbar";
ITEM.cost = 250;
ITEM.model = "models/weapons/w_crowbar.mdl";
ITEM.weight = 1;
ITEM.business = true;
ITEM.category = "Weapons";
ITEM.weaponClass = "cw_crowbar";
ITEM.description = "ItemCrowbarDesc";
ITEM.isMeleeWeapon = true;
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(-18, -5, 5);

ITEM.loweredAngles = Angle(-10, 10, -80);

ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(200, 200, 0);

ITEM.attachmentOffsetVector = Vector(0, 5, 2);

ITEM:Register();