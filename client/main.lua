CreateThread(function()
    local _dead = false
    while (true) do
        local _ped = PlayerPedId()

        if (_ped ~= nil and IsEntityDead(_ped) and not _dead) then
            local killer = GetPedKiller(_ped)
            local killerId = false
            
            for _, player in ipairs(GetActivePlayers()) do
                if killer == GetPlayerPed(player) then
                    killerId = GetPlayerServerId(player)
                    break;
                end
            end

            if (killerId) then
                TriggerServerEvent(
                    ("%s:server:cacheoAutomatico"):format(GetCurrentResourceName()),
                    killerId
                )
            end

            _dead = true;
        end
        if (not IsEntityDead(_ped)) then _dead = false; end
        Wait(250)
    end
end)
