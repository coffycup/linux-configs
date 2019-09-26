#!/usr/bin/env python3
import os
import sys

# ----- Declaring Constant Variables -----
PATH = "/sys/class/backlight/intel_backlight"
MIN_BRIGHTNESS = 1
with open (PATH + "/max_brightness", "r") as maxBrightness:
  MAX_BRIGHTNESS = int(maxBrightness.read().splitlines()[0])


# ---------- Set Brightness ----------
def setBrightness(percent):
  # Read current brightness
  with open (PATH + "/actual_brightness", "r") as current:
    currentBrightness = int(current.read().splitlines()[0])

  # Set brightness value
  if (option == "-inc"):
    currentBrightness += int(MAX_BRIGHTNESS * (percent/100))
    brightnessValue = min(currentBrightness, MAX_BRIGHTNESS)
  elif (option == "-dec"):
    currentBrightness -= int(MAX_BRIGHTNESS * (percent/100))
    brightnessValue = max(currentBrightness, MIN_BRIGHTNESS)
  else:
    return

  if (brightnessValue == 1 or brightnessValue == MAX_BRIGHTNESS):
    return

  # Set up system command and execute
  pwd = "your password goes here" # change this to your actual pwd
  cmd = "echo '" + pwd + "' | sudo -S -k su -c " + \
        "'echo {} > ".format(brightnessValue) + \
        PATH + "/brightness'"
  os.system(cmd)


# ---------- Global Main ----------
if __name__ == '__main__':
  '''
  Program needs to be ran in the following format:
  " ./brightness [OPTION] [PERCENT] "
  Where OPTION is one of:
   -inc    Increase brightness by PERCENT%
   -dec    Decrease brightness by PERCENT%
  '''
  try:
    option = sys.argv[1]
    percent = sys.argv[2]
    setBrightness(int(percent))
  except IndexError as idxErr:
    print("IndexError: " + idxErr.args[0])

