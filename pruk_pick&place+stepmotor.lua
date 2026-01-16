local Option_spd={CP=90, SpeedJ=80, AccJ=40}
local Option_slw={CP=60, SpeedJ=10, AccJ=5}

local PickDrop_offset={0, 0, -75.8, 0}

while(true)
do
  for i=0,3,1
  do
    MovL(InitialPose, Option_spd)
    MovL(P1, Option_spd)
    RelMovL(PickDrop_offset, Option_slw)
    DO(01, ON) --Vacuum
    DO(02, OFF) --Pressure
    Wait(50)
    MovL(P1, Option_spd)
    MovL(RelPoint(InitialPose, {-70, -178, 109, 0}), Option_spd)
    MovL(P2, Option_spd)
    RelMovL({0, 0, -32.3, 0}, Option_slw)
    DO(01, OFF) --Vacuum
    DO(02, ON) --Pressure
    Wait(50)
    MovL(P2, Option_spd)
    DO(01, OFF) --Vacuum
    DO(02, OFF) --Pressure
    Wait(50)
    Sync()
    if DI(03) == ON 
    then
      DO(03, ON)
      Wait(470)
      DO(03, OFF)
    end
    
  end
  MovL(RelPoint(InitialPose, {-70, -178, 109, 0}), Option_spd)
  DO(01, OFF) --Vacuum
  DO(02, OFF) --Pressure
  for j=0,3,1
    do
    Sync()
    if DI(03) == ON 
    then
      DO(03, OFF)
      MovL(RelPoint(InitialPose, {-70, -178, 109, 0}), Option_spd)
      MovL(P2, Option_spd)
      RelMovL({0, 0, -32.3, 0}, Option_slw)
      DO(01, ON) --Vacuum
      DO(02, OFF) --Pressure
      Wait(50)
      MovL(P2, Option_spd)
      MovL(RelPoint(InitialPose, {-70, -178, 109, 0}), Option_spd)
      MovL(P3, Option_spd)
      RelMovL(PickDrop_offset, Option_slw)
      DO(01, OFF) --Vacuum
      DO(02, ON) --Pressure
      Wait(50)
      DO(01, OFF) --Vacuum
      DO(02, OFF) --Pressure
      MovL(P3, Option_spd)      
    end
    DO(03, ON)
    Wait(470)
    DO(03, OFF)
  end
  break
end
DO(01, OFF) --Vacuum
DO(02, OFF) --Pressure
MovL(InitialPose, Option_spd)