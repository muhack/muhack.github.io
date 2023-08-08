---
layout: post
title: "CCC23 - MuHack Badge and MuTag"
subtitle: "Here all the info about the MuHack Badge and keychain"
categories: Events
date: 2023-08-07
author: MrMoDDoM
header-img: /public/img/2022-12-20-custom-sticker.jpg
hidden: true
---

# CCC23 - MuHack Badge and keychain

So you stumbled upon this strange circuit board and you want to know more about it? Well, you are in the right place!

## The MuHack Badge

This circular board is the official __MuHack Badge__. It's a board with an __RP2040__ (a 32-bit dual ARM Cortex-M0+) as main microcontroller running __MicroPython__, and the Bosh Sensor Hub __BHI160(B)__ as secondary microcontroller.

![Badge startup](/public/img/2023-07-08-CCC23-landing-page-badge-startup.gif)

This latter integrates a __3-axis gyroscope, a 3-axis accelerometer__ and a programmable microcontroller. The sensor also contains pre-installed fusion software and specific algorithms that enable always-on motion sensing. 
The BHI160(B) is also connected to the Bosh __BMM150__ magnetometer, a low power and low noise __3-axis digital geomagnetic__ sensor.

Thanks to the BHI160(B) and the BMM150, the MuHack Badge can be used to measure the orientation of the board in space, crushing a __full 9DOF IMU quaternion__, as well as __activity recognition__, such as step counting, wakeup/pickup/tilt/glance gesture and other motion related features.

![Badge startup](/public/img/2023-07-08-CCC23-landing-page-badge-rotate.gif)

*Note how the colors remain in the same position as the board is rotated*

The board also mounts an __NFC ISO 15 chip, the ST25DV__, and antenna that can be used to store data and communicate with other devices. It is connected to the RP2040 using I2C, allowing the microcontroller to read and write data to it, as well as sending and receiving interrupts.

An __ESP32 module can be optionally mounted__ to enable bluetooth and WiFi connectivity. It can be used to stream data to a computer or a smartphone, as well as connecting to the internet.

It's a simple board, but thank to the many GPIO pins, it's hackable and it's a great way to learn how to program microcontrollers.

### How to use it

First things first, you need to install __MicroPython__, download and drag&drop the firmware file on the board. You can find the latest firmware [here](https://micropython.org/download/rp2-pico/).

Then upload all the file within the `BOSS` folder of the official [MuHack Badge repository](https://github.com/MrMoDDoM/MuHack-Badge), and you are ready to go!

Once the board is flashed, you can connect to it using the serial port. If you are using Linux or MacOS, you can use the `screen` or `minicom` command, while if you are using Windows, you can use [PuTTY](https://www.putty.org/).


The firmware is still a WIP, so expect some bugs and missing features. If you want to contribute, feel free to open a pull request on the official repository.

## MuTag - The MuHack Keychain

The MuTag is a small keychain featuring an __ATTiny44a__ microcontroller and an __ST25DV__ NFC ISO15 tag.


![MuTag](/public/img/2023-07-08-CCC23-landing-page-mutag_v2_1.jpg)


Thanks to the __Energy Harvesting__ feature of the ST25DV, the MuTag can be __powered by the NFC field__ of a smartphone or a reader.

![MuTag leds](/public/img/2023-07-08-CCC23-landing-page-mutag-leds.gif)


From the MCU is it possible to access the NFC tag using I2C, to modify the tag's configuration and read/write data.

### How to use it

For programming the MuTag, you need an __ISP programmer__ (such as the [USBasp](https://www.fischl.de/usbasp/) or the [USBtinyISP](https://learn.adafruit.com/usbtinyisp) from Adafruit) or a [simple Arduino board](https://docs.arduino.cc/built-in-examples/arduino-isp/ArduinoISP), flashed with the ArduinoISP sketch.

Then, using the [Arduino IDE](https://www.arduino.cc/en/software) and the additional [ATTinyCore by SpenceKonde](https://github.com/SpenceKonde/ATTinyCore), simply program and upload a common Arduino sketch.

For some reference code, check out the official [MuTag repository](https://github.com/MrMoDDoM/MuTag)

> **[Don't forget to activate the Energy Harvesting feature of the ST25DV, otherwise the MuTag won't work!](https://github.com/MrMoDDoM/MuTag#activating-energy-harvesting-mode-with-the-st25-android-app)**

## GitHub repos

 - MuHack Badge: [https://github.com/MrMoDDoM/MuHack-Badge](https://github.com/MrMoDDoM/MuHack-Badge)
 - MuTag: [https://github.com/MrMoDDoM/MuTag](https://github.com/MrMoDDoM/MuTag)

## Something about us

__MuHack is the first hackerspace in Brescia, Italy__. We are a bunch of people that like to hack, build and learn new things. We're a non-profit organization and we're always looking for new members. 

If you want to know more about us, feel free to check our [website](http://muhack.org) and don't esitate to contact us.

You can also find us on [Telegram](https://t.me/muhack).