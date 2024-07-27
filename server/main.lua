ESX = nil

local rESX, rObj = pcall(function()
    ESX = exports['es_extended']:getSharedObject()
end)

if (not rESX and ESX == nil) then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
end

RegisterNetEvent(
    ("%s:server:cacheoAutomatico"):format(GetCurrentResourceName()),
    function(killerId)
        local _src = source
        if (not killerId or killerId ~= "") then return; end
        local xKilled = ESX.GetPlayerFromId(_src)

        if (xKilled) then
            local xKiller = ESX.GetPlayerFromId(killerId)
            
            if (xKiller) then
                local xKilledWeapons = xKilled.getLoadout()
                
                for i=1, #xKilledWeapons do
                    xKilled.removeWeapon(xKilledWeapons[i].name)
                    xKiller.addWeapon(xKilledWeapons[i].name)
                end
            end
        end
    end
)
