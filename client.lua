CreateThread(function()
    local textureStreams = {
        --[[
            To add your own ytd + positions, just use the template down below
            {
                name = "ur ytd name",
                markers = {
                    { pos = vector3(2959.0283, 2746.7778, 43.456386), scale = vector3(0.5, 1.5, 1.5)  },

                }
            },

        ]]
        {
            name = "luna",
            markers = {
                { pos = vector3(1559.3601, 3199.8022, 40.467117), scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(1555.4647, 3201.6147, 40.437942), scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(1552.108, 3203.2307, 40.412132),  scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(1552.111, 3205.946, 40.41154),    scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(1553.418, 3198.0412, 40.467613),  scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(1549.7999, 3200.3583, 40.434246), scale = vector3(0.5, 1.5, 1.5) },

            }
        },
        {
            name = "swat",
            markers = {
                --{ pos = vector3(1553.418, 3198.0412, 40.467613), scale = vector3(0.5, 1.5, 1.5)  },


            }
        },
        {
            name = "mine",
            markers = {
                { pos = vector3(1549.7999, 3200.3583, 40.434246), scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(2977.45, 2741.62, 44.62), scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(2982.64, 2750.89, 42.99),scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(2994.92, 2750.43, 44.04),scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(2958.21, 2725.44, 50.16),scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(2946.3, 2725.36, 47.94),scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(3004.01, 2763.27, 43.56),scale = vector3(0.5, 1.5, 1.5) },
                { pos = vector3(3001.79, 2791.01, 44.82), scale = vector3(0.5, 1.5, 1.5) },


            }
        },


    }

    while true do
        local sleep = 200
        local pos = GetEntityCoords(PlayerPedId(), true)

        for _, textureData in ipairs(textureStreams) do
            local textureStream = textureData.name

            if not HasStreamedTextureDictLoaded(textureStream) then
                RequestStreamedTextureDict(textureStream, true)
                while not HasStreamedTextureDictLoaded(textureStream) do
                    Wait(1)
                end
            else
                for _, markerInfo in ipairs(textureData.markers) do
                    local position = markerInfo.pos
                    local scale = markerInfo.scale
                    local dist = #(pos - position)

                    if dist < 10.0 then
                        sleep = 0
                        DrawMarker(9, position.x, position.y, position.z, 0.0, 0.0, 0.0, 0.0, 90.0, scale.x, scale.y,
                            scale.z, 1.1, 255, 255, 255, 255, false, false, 2, true, textureStream, textureStream, false)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
