local pitch = 30
local placeDown1 = 129
local placeDown2 = placeDown1 - 30
CP(100)

VACUUM   = 1
PRESSURE = 2

DO(VACUUM, OFF)
DO(PRESSURE, OFF)

local offsetX = {0, pitch, 0, pitch}
local offsetY = {0, 0, pitch, pitch}


local i = 1
local t = 1

Sync()
while(DI(9)== OFF)
do
  Sync()
  MovL(P5)
  MovL(P6)
  MovL(P7)
  Wait(500)
  DO(VACUUM, ON)
  DO(PRESSURE, OFF)
  Wait(500)
  MovL(P5)
  MovL(InitialPose)
  MovL(P1)
  MovL(P2)
  MovL(P3)
  Wait(500)
  DO(VACUUM, OFF)
  DO(PRESSURE, ON)
  Wait(500)
  DO(PRESSURE, OFF)
  Wait(200)
  MovL(P2)
  MovL(P1)
  MovL(InitialPose)
  DO(3,ON)
  Wait(470)
  DO(3,OFF)
end


while(i <= 4)
do
  
    Go(InitialPose)
    -- ===== หยิบ =====
    Sync()
    if DI(9) == ON
    then 
      MovL(P1)
      MovL(P2)
      MovL(P3)
      
      Wait(500)
      DO(VACUUM, ON)
      DO(PRESSURE, OFF)
      Wait(500)

      MovL(P2)
      MovL(P1)
      Go(InitialPose)
      -- ===== ไปฐานวาง =====
      MovL(P4)

      -- ===== ขยับไปตำแหน่ง 2x2 =====
      local dx = offsetX[i]
      local dy = offsetY[i]

      local moveXY = {dx, -dy, 0, 0}
      RelMovL(moveXY)

      -- ===== ลงวาง =====
      local down = {0, 0, -placeDown1, 0}
      RelMovL(down)

      Wait(500)
      DO(VACUUM, OFF)
      DO(PRESSURE, ON)
      Wait(500)
      DO(PRESSURE, OFF)
      Wait(200)

      -- ===== ยกขึ้น =====
      local up = {0, 0, placeDown1, 0}
      RelMovL(up)
      Go(InitialPose)
      i = i+1
      DO(3,ON)
      Wait(470)
      DO(3,OFF)
    else
      Go(InitialPose)
    end
end

Sync()
while(DI(9)== OFF)
do
  Sync()
  MovL(P5)
  MovL(P6)
  MovL(P7)
  Wait(500)
  DO(VACUUM, ON)
  DO(PRESSURE, OFF)
  Wait(500)
  MovL(P5)
  MovL(InitialPose)
  MovL(P1)
  MovL(P2)
  MovL(P3)
  Wait(500)
  DO(VACUUM, OFF)
  DO(PRESSURE, ON)
  Wait(500)
  DO(PRESSURE, OFF)
  Wait(200)
  MovL(P2)
  MovL(P1)
  MovL(InitialPose)
  DO(3,ON)
  Wait(470)
  DO(3,OFF)
end

while(t <= 4)
do
  
    Go(InitialPose)
    -- ===== หยิบ =====
    Sync()
    if DI(9) == ON
    then 
      MovL(P1)
      MovL(P2)
      MovL(P3)

      Wait(500)
      DO(VACUUM, ON)
      DO(PRESSURE, OFF)
      Wait(500)

      MovL(P2)
      MovL(P1)
      Go(InitialPose)
      -- ===== ไปฐานวาง =====
      MovL(P4)

      -- ===== ขยับไปตำแหน่ง 2x2 =====
      local dx = offsetX[t]
      local dy = offsetY[t]

      local moveXY = {dx, -dy, 0, 0}
      RelMovL(moveXY)

      -- ===== ลงวาง =====
      local down = {0, 0, -placeDown2, 0}
      RelMovL(down)

      Wait(500)
      DO(VACUUM, OFF)
      DO(PRESSURE, ON)
      Wait(500)
      DO(PRESSURE, OFF)
      Wait(200)

      -- ===== ยกขึ้น =====
      local up = {0, 0, placeDown2, 0}
      RelMovL(up)
      Go(InitialPose)
      t = t+1
      DO(3,ON)
      Wait(480)
      DO(3,OFF)
    else
      Go(InitialPose)
    end
end