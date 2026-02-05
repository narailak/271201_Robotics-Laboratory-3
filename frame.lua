-- Version: Lua 5.3.5
local Option1={CP=25, SpeedJ=50, AccJ=25}
local Option2={CP=1, SpeedJ=15, AccJ=5}

local Boxcount = 4
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
 Wait(825)
 DO(9,OFF)
end

MovJ(InitialPose,Option1)
Unvac()
while (c < Boxcount) do
  MovJ(P1,Option1)
  MovL(RelPoint(P1, {0, 0, -120, 0}), Option1)
  MovL(RelPoint(P1, {0, 0, -152.5, 0}), Option2)
  Vac()
  MovL(RelPoint(P1, {0, 0, -120, 0}), Option2)
  MovJ(P1,Option1)
  MovJ(P3, Option1)
  MovL(RelPoint(P3, {0, 0, -39.89, 0}), Option2)
  Unvac()
  MovJ(P3, Option2)
  Wait(300)
  qspin()
  c = c + 1
end
while(c ~= 0) do
  Wait(300)
  Sync()
  if DI(😎 == 1 then
    MovL(P3, Option1)
    MovL(RelPoint(P3, {-1.5, 0, -39.89, 0}), Option2)
    Vac()
    MovL(P3, Option2)
    MovL(P2, Option1)
    qspin()
    MovL(RelPoint(P2, {0, 0, -120, 0}), Option1)
    MovL(RelPoint(P2, {0, 0, -130.5, 0}), Option2)
    Unvac()
    MovL(RelPoint(P2, {0, 0, -120, 0}), Option2)
    MovL(P2, Option1)
    c = c - 1
  else
    Wait(300)
    qspin()
    c = c - 1
  end
end
MovJ(InitialPose,Option1)