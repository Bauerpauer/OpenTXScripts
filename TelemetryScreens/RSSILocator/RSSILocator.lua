-- RSSI Model Locator
-- by Scott Bauer 6/21/2015
--
-- Copy this into a SCRIPTS/<modelname>/ with the name `telem#.lua`,
-- where # is telemetry screen number you'd like to use.  Drop
-- `sbeep.wav` into the `SOUNDS/` folder.
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
  lcd.drawNumber(210, 10, getValue("rssi"), XXLSIZE)
  lcd.drawText(187, 54, "RSSI", 0)

  if getTime() >= nextPlayTime then
    playFile("/SOUNDS/sbeep.wav")
    nextPlayTime = getTime() + delayMillis - getValue("rssi")
  end
end

return { run = run }
