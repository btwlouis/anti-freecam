local function violatePlayer(playerId)
    local recievedScreenshot = false

    TriggerClientEvent('freecam:capture', playerId, Config.Webhook)

    local eventHandler = RegisterNetEvent('freecam:recievedScreenshot', function(data)
        recievedScreenshot = true
        print("recievedScreenshot", source, data)
    end)

    local timeout = Config.TimeoutScreenshot or 30

    repeat
        Wait(1000)

        timeout = timeout - 1
        
        if timeout <= 0 then
            break
        end
    until recievedScreenshot

    if not recievedScreenshot then
        print('Player did not upload screenshot.')
        return
    end

    RemoveEventHandler(eventHandler)
    
    DropPlayer(playerId, 'You have been flagged for cheating.')
end

local function checkPlayer(playerId)
    local coords = GetEntityCoords(GetPlayerPed(playerId))
    local getPlayerFocusPos = GetPlayerFocusPos(playerId)

    if #(coords - getPlayerFocusPos) > Config.FlagDistance then
        violatePlayer(playerId)
    end
end

CreateThread(function()
    while true do 
        Wait(Config.RefreshRate) 

        for _, playerId in pairs(GetPlayers()) do 
            checkPlayer(playerId)
        end
    end
end)
