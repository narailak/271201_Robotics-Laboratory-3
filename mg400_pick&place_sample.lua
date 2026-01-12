-- ใช้ for loop ในการทำงานซ้ำ แทน mg400_pick&place_condition.lua เนื่องจากมีประสิทธิภาพมากกว่าแล้วกำหนด condition ได้ง่ายกว่า
local Option_spd={CP=80, SpeedJ=80, AccJ=40}
local Option_slw={CP=40, SpeedJ=10, AccJ=5}
MovL(InitialPose, Option_spd)
DO(01, OFF) --pressure
DO(02, OFF) --vacuum
local offset_down = {0, 0, -35, 0}
local offset_up = {0, 0, 35, 0}

local Waypoint = {-25, 27.5, 34, 0} -- point 

for k=0,1,1
do
  for j=0,1,1
  do
    for i=0,1,1
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
      MovL(RelPoint(P2, {Waypoint[1]*i, Waypoint[2]*j, Waypoint[3]*k, Waypoint[4]*i}),Option_spd)
      Wait(50)
      RelMovL(offset_down, Option_slw)
      DO(01, ON) --pressure
      DO(02, OFF) --vacuum
      RelMovL(offset_up, Option_slw)
      end
  end
end
Wait(500)
DO(01, OFF) --pressure
DO(02, OFF) --vacuum
MovL(InitialPose, Option_spd)