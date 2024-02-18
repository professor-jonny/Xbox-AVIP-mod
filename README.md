# Xbox Avip mod
![AVIP BRD](https://github.com/professor-jonny/Xbox-AVIP-mod/raw/main/pictures/avip%20v2.jpg)

## Project Info
We all know that modern TV's are going away from component and composite video inputs in favor of newer technologies such as HDMI because of this there has been many people attempting various mods some great, some sketchy and some down right wrong.

This project started as I have seen a few people damage their Xbox consoles by attempting VGA and HDMI mods or made such a bad job of it that that I decided something needed to be done and I set out to make up a basic QSB to break out signals that you can use within the console to attached to external connectors or for use with an internal video adaptor solution.
Design goals were to be simple quick to install and have no complicated binary logic external switches to select the video modes.

The design also includes a buffer circuit to drive the internal h and v sync signals to 5v to give you proper VGA compliant signals with a suitable bios.

The system includes a PICAXE microcontroller to be able to switch video modes and other trickery, I designed it using this over a traditional microcontroller for ease of a user to modify using a three wire serial connection (in circuit) and partly from my lack of programming skills and time.
The PICAXE system enables any one to reprogram it without too much hassle and with minimal programming knowledge, both flow chart and basic programs are provided as samples that are easy to follow and understand.

I have also designed some breakout boards to join to the AVIP mod board, or you could use get IPEX/ U.FL to solder tails to connect to some sort of internal adaptor or converter in my perisomal Xbox I milled pads to place IPEX/ U.FL sockets on a component to HDMI adaptor.

I had double ended U.FL /IPEX Connectors made for this project officially the connectors are actually 50 ohm but were made with 75 ohm cable so the impedances are not perfect but it was the only aspect of the project I was not happy with, I planned to further update this project with a flex or FFC cable between boards but I'm unsure on impedance matching and the design of such a cable if someone can offer us some help with that I would be very grateful.

I realize at 720p the bandwidth can tip 75MHZ so the cable will need to be designed with microstrip or stripline transmission mitred bends or as such but I don't know much about the property's of these FFC cables or FlexPCB's or their connectors.

## Rational over other mods
I realize that there are other mods that offer better solutions or something of a similar goal such as native digital output or internal component to HDMI etc... but many are not simple or cost effective.
Many require de-soldering the original AVIP connector or micro soldering and for many people this is something that is beyond their skill set but a QSB solution is very noob friendly and hence my project.

## Features
The AVIP  mod has the following features:
  * Pluggable RF connectors for AV signals.
  * Impedance matched shielded analogue signals.
  * Automatic selection of backup AV mode.
  * VGA compliant 5V buffered V and H sync signals (non inverted).
  * Video mode toggling.
  * Fits all motherboard revisions.
  * Additional optional audio and video breakout boards.
  * Open source design.
  * In circuit user reprogrammable.
  * Audible/ light mode indication options.
  * Expansion capabilities.
  * AV pack boot fix (boot console without AV pack fitted).
  * Ability to still use original AV packs with this mod fitted.
  * Still works with Light Guns with a suitable TV and connection.
  * auto reconfigure of mode selection on reboot of console.


## Break out boards
I have managed to design some break out boards for the system my goal was to design them to be panel mounting on the back of the Xbox and look as if they were part of the system and not a hackjob.
I managed to find vertical components for the Break Out PCB's so I could mount the Break out board's Panel mount direct on the back of the Xbox with a spacer as opposed to a right angle mount PCB sockets so all that one would need is bolts and some nylon spacers and a Dremel tool to fit them.

you will notice that the component board provides every signal via RCA connectors to the back of the Xbox and it has a gap on either side where I would suggest you could place something else there like a 3.5mm vertical socket to power an external HDMI adaptor.

## Variants
I have modified the original v2 design with just some minor changes to do with the weird package format 2n2222a transistors I originally brought that I could not find again on aliexpress.
I have created two new V4 design's, one top mounted option for use with the Open XHD project (currently unfinished) and a new design with a greatly simplified sync buffer circuit, be aware that both these options currently are un tested and released "as is"

## Eagle library's
Along with v3 and v4 models I decided to create a proper library for the AVIP footprints and create an actual schematic as I did the v1 and 2 designs straight from a PCB layout with the footprint done with vias on the board, yes shocking I know but I feel much better now with the later designs that someone can mess with them with a lot less difficulty.


## Notes
I have made a proto type V1 board and have sold a few and can be considered tested but I have not made a v2 design the version 2 design just adds a few features an components but is basically unchanged from a design perspective.
list of Changes:
  * resistors on the serial data lines to force the PICAXE to start-up in RUN mode with out an external jumper.
  * Mode select current limiting resistors for the AV pack mode lines (thanks Psycho-Chewbacca for the tip here).
  * + and - terminal for programming outside of the console.
  * capacitor added to make PCB fit nicer on V1.6 consoles (bottom variant only).
  * added notch to clear the support on the bottom of the case (also spaced apart the RF connectors).
  * reset line to LPC port to reboot PICAXE on reboot of console.
  * upped resistor sizes to make hand soldering possible (I found this out the hard way)


## Future plans
I thought of combining an XIRC into this as the m2 does virtual multitasking and has a learning IR code library embedded and a small EPROM to store IR codes it would just need to be connected to stand by power and a handful of components to remote power on the Xbox from an IR remote control, but for the time being ill leave that up to you guys to modify looking forward to seeing a version 2 from someone :-) it will require voltage clamps for the mode select pins as the standby voltage is 3.3v but the mode pins are 5v.

the inclusion of a video Buffer to drive the external signals is not a bad idea as officially if you connect a AV pack and a external device you are driving two impedance match signals from the same output on the Xbox this was not really the intention of the project I only intend to use one output at a time.

# Links to software
This PCB design was done in eagle which is free to use and can be found here:

[Autodesk Eagle]( https://www.autodesk.com/products/eagle/free-download)

The PICAXE was programmed with the PICAXE editor 6 which can be found here:

[PICAXE Editor 6](https://picaxe.com/software/picaxe/picaxe-editor-6/)

The PCB design was converted to a sketch-up model by using the Eagleup script you can find information on the install and usage of it here:

[Eagleup ](https://eagleup.wordpress.com/installation-and-setup/)

The 3D model was done with SketchUp and a 30 day trial can be found here:

[SketchUp Trial](https://www.sketchup.com/try-sketchup)

You may use the free online version here:

[SketchUp Free](https://www.sketchup.com/plans-and-pricing/sketchup-free)

## Installation and programming Manual
You can find the latest version of the Installation and programming manual here it has additional info not available in this read me:

[AVIP mod Google Docs Manual](https://docs.google.com/document/d/1ht77iEsDnr8k5D_PiUR8pX0tqKVkKB9yM1Bdu0-4m4M/edit?usp=sharing)


## pictures
There is a few sample pictures located [here](https://github.com/professor-jonny/Xbox-AVIP-mod/tree/main/pictures) in the repo and a few extra below:

VGA break out board:

![VGA](https://github.com/professor-jonny/Xbox-AVIP-mod/raw/main/pictures/vga%20model%20back.jpg)

proto type v1:

![PROTO v1](https://github.com/professor-jonny/Xbox-AVIP-mod/raw/main/pictures/prototype.JPG)

proto type v3:

![PROTO v3](https://github.com/professor-jonny/Xbox-AVIP-mod/blob/main/pictures/avip-mod%20v3.png)

proto type v4:

![PROTO v4](https://github.com/professor-jonny/Xbox-AVIP-mod/blob/main/pictures/avip-mod%20v4.png)

proto type v4 top:

![PROTO v4 top](https://github.com/professor-jonny/Xbox-AVIP-mod/blob/main/pictures/avip-mod%20v4%20top.png)











Wired to a component to HDMI adaptor:

![HDMI SAMPLE](https://github.com/professor-jonny/Xbox-AVIP-mod/raw/main/pictures/hdmi%20sample.JPG)

![HDMI in place](https://github.com/professor-jonny/Xbox-AVIP-mod/blob/main/pictures/hdmi%20in%20place.jpg)

![HDMI plug location](https://github.com/professor-jonny/Xbox-AVIP-mod/blob/main/pictures/12122015187.jpg)

## Licensing
This Project is free and open source.
  *  Hardware is shared under the [CERN OHL version 2.0.](https://ohwr.org/cernohl).
  *  The PICAXE program is shared under [GPLv3](https://www.gnu.org/licenses/quick-guide-gplv3.en.html).

If you like my work please consider a small donation to the XBMC4XBOX forum or one of the many Great Xbox resources out there you may also send me sample of clones of this project or buckets or cash or what ever :-)

For those interested there is also a bit of a build log [here on the XBMC4XBOX forum](https://www.xbmc4xbox.org.uk/forum/viewtopic.php?f=13&t=3644&hilit=xbox+avip+mod )

Id Like to Thank all that have helped to get it where it is today and a shutout to he crew over at XBMC4XBOX and a thanks to Psycho-Chewbacca (AKA benny Diamond) for his help.
