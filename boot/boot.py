#! /usr/bin/env python3

# example #1 - WiFi connection at boot
#from pynq.lib import Wifi
#
#port = Wifi()
#port.connect('your_ssid', 'your_password', auto=True)

# example #2 - Change hostname
#import subprocess
#subprocess.call('pynq_hostname.sh aNewHostName'.split())

# example #3 - blink LEDs (PYNQ-Z1, PYNQ-Z2, ZCU104)
#from pynq import Overlay
#from time import sleep
#
#ol = Overlay('base.bit')
#leds = ol.leds
#
#for _ in range(8):
#    leds[0:4].off()
#    sleep(0.2)
#    leds[0:4].on()
#    sleep(0.2)#!/bin/env python3.8

from time import sleep
from pynq.overlays.base import BaseOverlay

base = BaseOverlay("base.bit")

rgbleds = [base.rgbleds[i] for i in range(4, 6)]
leds = [base.leds[i] for i in range(4)]

# Toggle board LEDs leaving small LEDs lit
for i in range(8):
    [l.off() for l in leds]
    [rgbled.off() for rgbled in rgbleds]
    sleep(.2)
    [l.on() for l in leds]
    [rgbled.on(1) for rgbled in rgbleds]
    sleep(.2)

[rgbled.off() for rgbled in rgbleds]
