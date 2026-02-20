dx = -31
dy = 31
dz = 30.5

setup()
CP(100)

for layer = 0, 3 do
  local boxes_in_layer = 3 - layer
  for col = 0, boxes_in_layer do
    
    local shift = (layer * dx) / 2
    x_off = (col * dx) + shift
    
    y_off = 0 
    z_off = layer * dz

    -- == Pick ==
    MovJ(P1)
    MovL(P2)
    DO(1, OFF)
    DO(2, ON)

    -- == Place ==
    Jump(RelPoint(P3, {x_off, y_off, z_off, 0}))
    MovL(RelPoint(P4, {x_off, y_off, z_off, 0}))
    DO(1, ON)
    DO(2, OFF)
    Wait(100)

    DO(1, OFF)
    DO(2, OFF)
    MovL(RelPoint(P3, {x_off, y_off, z_off, 0}))
  end
end