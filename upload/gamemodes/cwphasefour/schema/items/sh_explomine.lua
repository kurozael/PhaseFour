--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "ItemExplomine";
ITEM.uniqueID = "explomine";
ITEM.cost = 100;
ITEM.batch = 1;
ITEM.model = "models/props_combine/combine_mine01.mdl";
ITEM.weight = 2;
ITEM.business = true;
ITEM.category = "Deployables";
ITEM.description = "ItemExplomineDesc";
ITEM.requiresExplosives = true;

-- Called when the item's shipment entity should be created.
function ITEM:OnCreateShipmentEntity(player, batch, position)
	local entity = ents.Create("cw_explomine");
	
	Clockwork.player:GiveProperty(player, entity, true);
	
	entity.cwAlliance = player:GetAlliance();
	entity:SetAngles(Angle(0, 0, 0));
	entity:SetPos(position);
	entity:Spawn();
	
	return entity;
end;

-- Called when the item's drop entity should be created.
function ITEM:OnCreateDropEntity(player, position)
	return self:OnCreateShipmentEntity(player, 1, position);
end;

-- Called when a player attempts to order the item.
function ITEM:CanOrder(player)
	local trace = player:GetEyeTraceNoCursor();
	
	for k, v in ipairs(ents.FindInSphere(trace.HitPos, 128)) do
		if (v:IsPlayer() and player != v) then
			Clockwork.player:Notify(player, "You cannot order a landmine near another character!");
			
			return false;
		end;
	end;
	
	local totalMines = 0;
	
	totalMines = totalMines + Clockwork.player:GetPropertyCount(player, "cw_freezemine");
	totalMines = totalMines + Clockwork.player:GetPropertyCount(player, "cw_explomine");
	totalMines = totalMines + Clockwork.player:GetPropertyCount(player, "cw_firemine");
	
	if (totalMines >= 3) then
		Clockwork.player:Notify(player, "You have reached the maximum amount of landmines!");
		
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
	local totalMines = 0;
	
	totalMines = totalMines + Clockwork.player:GetPropertyCount(player, "cw_freezemine");
	totalMines = totalMines + Clockwork.player:GetPropertyCount(player, "cw_explomine");
	totalMines = totalMines + Clockwork.player:GetPropertyCount(player, "cw_firemine");
	
	if (totalMines >= 3) then
		Clockwork.player:Notify(player, "You have reached the maximum amount of landmines!");
		
		return false;
	end;
end;

ITEM:Register();