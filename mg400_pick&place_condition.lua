-- Version: Lua 5.3.5
-- This thread is the main thread and can call any commands.
-- มีการตรวจสอบชิ้นงานด้วยเซ็นเซอร์ที่จุดวางชิ้นงาน
local Option_spd={CP=80, SpeedJ=80, AccJ=40}
local Option_slw={CP=40, SpeedJ=10, AccJ=5}
MovL(InitialPose, Option_spd)
DO(01, OFF) --pressure
DO(02, OFF) --vacuum

for k=0,10,1
do
MovL(P1, Option_spd)
Wait(100)
MovL(P2, Option_slw)
DO(01, OFF) --pressure
DO(02, ON) --vacuum
Wait(100)
MovL(P1, Option_spd)
MovL(P7, Option_spd)
Wait(50)
MovL(P3, Option_spd)
Wait(100)
MovL(P4, Option_slw)
DO(01, ON) --pressure
DO(02, OFF) --vacuum
Wait(100)
DO(01, OFF) --pressure
DO(02, OFF) --vacuum
MovL(P3, Option_spd)
Wait(1000)
Sync()
if DI(08) == ON 
then
    MovL(P4, Option_slw)
    DO(01, OFF) --pressure
    DO(02, ON) --vacuum
    Wait(100)
    MovL(P3, Option_spd)
    MovL(P5, Option_spd)
    MovL(P6, Option_slw)
    DO(01, ON) --pressure
    DO(02, OFF) --vacuum
    Wait(100)
    DO(01, OFF) --pressure
    DO(02, OFF) --vacuum
    MovL(P5, Option_spd)
    MovL(InitialPose, Option_spd)

	
else	
    MovL(InitialPose, Option_spd)
    DO(01, OFF) --pressure
    DO(02, OFF) --vacuum
	

end

end