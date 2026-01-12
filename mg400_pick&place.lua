local Option_spd={CP=80, SpeedJ=80, AccJ=40}
local Option_slw={CP=40, SpeedJ=10, AccJ=5}
MovL(InitialPose, Option_spd)
DO(01, OFF) --pressure
DO(02, OFF) --vacuum
local offset_down = {0, 0, -35, 0}
local offset_up = {0, 0, 35, 0}

local R1C2 = {-25, 0, 0, 0} -- point 2
local R2C1 = {0, 27.5, 0, 0} -- point 3
local R2C2 = {-25, 27.5, 0, 0} -- point 4

for i=0,3,1
do
  MovL(InitialPose, Option_spd)
  MovL(P1, Option_spd)
  Wait(100)
  MovL(RelPoint(P1, {0, 0, -30, 0}), Option_slw)
  DO(01, OFF) --pressure
  DO(02, ON) --vacuum
  MovL(P1, Option_spd)
  MovL(InitialPose, Option_spd)
  Wait(50)
  if (i == 0)
    then
        MovL(P2, Option_spd)
        Wait(50)
        MovL(RelPoint(P2, offset_down),Option_slw)
        DO(01, ON) --pressure
        DO(02, OFF) --vacuum
    end
  if (i == 1)
    then
        MovL(RelPoint(P2, R1C2),Option_spd)
        Wait(50)
        RelMovL(offset_down, Option_slw)
        DO(01, ON) --pressure
        DO(02, OFF) --vacuum
    end
  if (i == 2)
    then
        MovL(RelPoint(P2, R2C1),Option_spd)
        Wait(50)
        RelMovL(offset_down, Option_slw)
        DO(01, ON) --pressure
        DO(02, OFF) --vacuum
    end
  if (i == 3)
    then
        MovL(RelPoint(P2, R2C2),Option_spd)
        Wait(50)
        RelMovL(offset_down, Option_slw)
        DO(01, ON) --pressure
        DO(02, OFF) --vacuum
    end
 RelMovL(offset_up, Option_slw)
  
end
Wait(500)
DO(01, OFF) --pressure
DO(02, OFF) --vacuum
MovL(InitialPose, Option_spd)