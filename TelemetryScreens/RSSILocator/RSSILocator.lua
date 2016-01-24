-- RSSI Model Locator
-- by Scott Bauer 6/21/2015
--
-- Copy this into a SCRIPTS/TELEMETRY/ with the name `LM###.lua`,
-- where ### is a number used to identify the script later on. (i.e. LM100.lua  Drop
-- `sbeep.wav` into the `SOUNDS/` folder.
--
-- In your radio, go into the Telemetry page and in the screen you want to use select
-- "Script" and the script with the name you just wrote.
--
-- When you inevitably drop your quad into tall grass, long-press
-- "Page" until you enter Telemetry Mode.  Press "Page" until you
-- continious short beeps.  As you get closer to your model the
-- beeps will become more frequent, hopefully leading you to the
-- crash site.

local delayMillis = 100
local nextPlayTime = getTime()

local function run(event)
  -- Title
  lcd.drawText(3, 3, "RSSI Model Locator", 0)

  -- RSSI # and Label
  lcd.drawNumber(210, 10, getValue(202), XXLSIZE)
  lcd.drawText(187, 54, "RSSI", 0)

  if getTime() >= nextPlayTime then
    playFile("/SOUNDS/sbeep.wav")
    nextPlayTime = getTime() + delayMillis - getValue(202)
  end
end

return { run = run }
