local blipsCreated = false

CreateBlips = function()
    if blipsCreated then
        return
    end

    for k, v in pairs(Config.Blips) do
        if v.enabled then
            local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(blip, v.sprite)
            SetBlipScale(blip, v.scale)
            SetBlipColour(blip, v.color)
            SetBlipAsShortRange(blip, v.shortRange)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.name)
            EndTextCommandSetBlipName(blip)
        end
    end

    blipsCreated = true
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        CreateBlips()
    end
end)