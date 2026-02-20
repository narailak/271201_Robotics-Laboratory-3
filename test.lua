-- Version: Lua 5.3.5
local Option_spd={CP=80, SpeedJ=80, AccJ=40}
local Option_slw={CP=40, SpeedJ=10, AccJ=5}
local c = 0


function Vac()
  DO(1,ON)
  DO(2,OFF)
  Wait(300)
  DO(1,OFF)
end
function Unvac()
  DO(1,OFF)
  DO(2,ON)
  Wait(100)
  DO(2,OFF)
end

function qspin()
 DO(9,ON)
 Wait(474)
 DO(9,OFF)
end



for k=0,1,1
do
  MovL(InitialPose, Option_spd)
  MovL(RelPoint(P1, {0, 0, 120, 0}), Option_slw)
  MovL(P1,Option_slw)
  Vac()
  MovL(RelPoint(P1, {0, 0, 120, 0}), Option_slw)
  MovL(P2,Option_slw)
  Unvac()

end







