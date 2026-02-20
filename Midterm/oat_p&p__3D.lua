-- Version: Lua 5.3.5
local Option_spd={CP=80, SpeedJ=80, AccJ=40}
local Option_slw={CP=40, SpeedJ=10, AccJ=5}
local Waypoint = {-25, 27.5,34, 0} -- point 
local offset_down = {0, 0, -55.59, 0}



function Vac()
  DO(1,ON)
  DO(2,OFF)
end
function Unvac()
  DO(1,OFF)
  DO(2,ON)
  Wait(100)
  DO(2,OFF)
end

function qspin()
 DO(9,ON)
 Wait(390)
 DO(9,OFF)
end

for k=0,1,1
do
  for j=0,1,1
  do
    for i=0,1,1
    do
  MovL(InitialPose, Option_spd)
  MovL(P2, Option_spd)
  MovL(P1, Option_slw)  
  Vac()
  Wait(200)
  MovL(P2, Option_spd)
  MovL(RelPoint(P6, {Waypoint[1]*i, Waypoint[2]*j, Waypoint[3]*k, Waypoint[4]*i}), Option_slw)
  Wait(50)
  RelMovL(offset_down, Option_slw)
  Unvac()
  Wait(50)
  MovL(P6, Option_spd)
  end
  end
end

