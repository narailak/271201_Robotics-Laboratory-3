-- Version: Lua 5.3.5
-- This thread is the main thread and can call any commands.
-- มีการตรวจสอบชิ้นงานด้วยเซ็นเซอร์ที่จุดวางชิ้นงาน

local Option_spd = {CP=80, SpeedJ=80, AccJ=40}
local Option_slw = {CP=40, SpeedJ=10, AccJ=5}

MovL(InitialPose, Option_spd)
DO(01, OFF) -- pressure
DO(02, OFF) -- vacuum

-- ===== Loop เอาไปวางที่จัดเก็บ =====
for k = 0, 3, 1 do
    Sync()

    if DI(03) == ON then
        -- หมุน
        DO(13, ON)
        if (k % 2 == 0) then
            Wait(473)
        else
            Wait(472)
        end
        DO(13, OFF)
    end

    MovL(P1, Option_spd)
    Wait(100)
    MovL(P2, Option_slw)
    DO(10, OFF)
    DO(11, ON)
    Wait(300)
    MovL(P1, Option_spd)
    MovL(P3, Option_spd)
    Wait(100)
    MovL(P4, Option_slw)
    DO(10, ON)
    DO(11, OFF)
    Wait(100)
    DO(10, OFF)
    DO(11, OFF)
    MovL(P3, Option_spd)
    Wait(1000)
end

-- ===== Loop เอาวางที่วางไปส่ง =====
for j = 0, 3, 1 do
    Sync()
    if DI(03) == ON then
        MovL(P4, Option_slw)
        DO(10, OFF)
        DO(11, ON)
        Wait(100)
        MovL(P3, Option_spd)
        MovL(P5, Option_spd)
        MovL(P6, Option_slw)
        DO(10, ON)
        DO(11, OFF)
        Wait(100)
        DO(10, OFF)

        MovL(P5, Option_spd)
        MovL(P3, Option_spd)
    end
    -- หมุนทุกครั้งของ loop
    DO(13, ON)
    Wait(473)
    DO(13, OFF)
end
