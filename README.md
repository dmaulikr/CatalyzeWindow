# CatalyzeWindow
In November as the days grew dimmer the Catalyze Chicago team started getting a bit frustrated with the windows in our main co-working space. They consist of two banks of frosted glass cubes that are wonderful at difusing sunlight, but terrible at letting everyone inside look out at the ever-bustling Lake Street. More importantly, they don't allow to pedestrian and train traffic to take a peek at all of the exciting things going on here at Catalyze!

Our team has always had an interest in creating display systems : [Multi-touch Experiments](https://vimeo.com/55191841), [Morphield](https://vimeo.com/46346609), [Persistence](https://www.youtube.com/watch?v=IeoKp3sgJsY), and [Autoloop](https://www.youtube.com/watch?v=6lb1NyAhTYM) just to name a few. While looking up at those two banks of symmetrical glass cubes we thought, "Hey! We've got some dead pixels on our hands!" So we set to work to bring them to life.

[Harvey Moon](http://unanything.com) was working at [Leviathan](http://www.lvthn.com) at the time, and had done some amazing work with [Lady Ada's Neopixels](https://learn.adafruit.com/adafruit-neopixel-uberguide/overview) in conjunction with Micah Scott's [FadeCandy](https://github.com/scanlime/fadecandy) hardware. We took this knowledge and set out to build out a system that allowed us to individually address each glass 'pixel' in our windows.


![Catalyze Window At Night](https://www.dropbox.com/s/vey224h2fsqhlhw/IMG_7084.jpg?dl=1 "Catalyze Window At Night")


The first step along our way was to make sure that the FadeCandies and connections to LED strips and power would be as secure as possible. To do this, we designed up a quick breakout board, and had them produced here in Chicago by our good friends over at [Twisted Traces](https://www.twistedtraces.com). 

![PCB](https://www.dropbox.com/s/clbok31pnmnaat2/IMG_1120.JPG?dl=1 "CatalyzeWindow PCB")

The [Eagle](http://www.cadsoftusa.com) files for this board are available here in the repo with a full bill of materials (check part attributes in Eagle). [Dave Hull](http://davidhulldesign.com) was kind enough to whip up some awesome laser cut acrylic enclosures that fit our PCBs and housed the 20 Amp 5 Volt power supplies responsbile for powering up the LED strips.

![All Parts Here](https://www.dropbox.com/s/o3tpvm8jtv10c7w/IMG_7291.jpg?dl=1 "All Parts Waiting For Glory")

The FadeCandies are limited to 64 pixels per channel, with 8 channels per board, so we built out a plan to cut down each reel of LEDs into strips that would meet these constraints. With all of our NeoPixel (WS2811) reels, FadeCandies, PCBs, and power supplies in hand, we set out to start the long process of cutting down the strips and soldering on connectors.

![Catalyze Team](https://www.dropbox.com/s/xojdsv6mjfgj7z6/IMG_7209.jpg?dl=1 "Dave, Harvey, and Josh on the Assembly Line")

With LED strips cut down, we started work mounting them with small sections of VHB tape.

![Josh Installing Strips](https://www.dropbox.com/s/1u056q778wj8pa0/installing.jpg?dl=0 "Josh Installing LED Strips")

With all of the LED strips in place and connected to our FadeCandy breakout boards we wired each back to a USB Hub that was under the keen supervision of our [O-DROID C1](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G141578608433) running [FadeCandy Server](https://github.com/scanlime/fadecandy/tree/master/server). We then mapped out each of the strips in Processing (available in this repo), and coded up a quick API.

#API Details
We'd love to see more code written for these windows! The only requirement at this point is that you be connected to our local network. Our window server is running on Ashpool.local and accepts UDP messages on port 6699. Here are the messages it knows about:

##Change the color of a pixel
Send:

`x,y,r,g,b` or `x,y`

Where x and y are the coordinate positions of the pixel you'd like to change color of, and R, G, and B are the Red, Green, and Blue values you'd like the pixel to be (0 - 255). You can also leave off the RGB values, and the server will inerpret this as a request to turn the pixel white.

##Turn off all LEDs
Send:

`r!`

##Turn On Automarch
Send:

`am!x`

Where x is an int value representing milliseconds. Automarch moves each column of pixels over to left once a certain period of time has elapsed. For example, if you'd like to have the display scroll each pixel from right to left every one and a half seconds you send the command `am!1500`

##Manual March
Send:

`m!`

This moves every column of pixels over by one. Pixels at the end of the display get wrapped around to the far side.

##Add a new client
Send:

`a!`

This logs a client's IP address. Every time the pixel data changes this IP address will recieve a UDP message that contains the current pixel data.

##Remove a client
Send:

`x!`

This removes a client from pixel data updates

##Query Automarch
Send:

`am?`

This asks the server for the current automarch settings. The server will respond with `y,x` or `n,x` where y = YES and n = NO, and x = current automarch timer in milliseconds.

#iOS App

If you're looking to just to play around with the windows we have an iOS app on the App Store [available here](https://itunes.apple.com/us/app/catalyze-glass/id951379952?mt=8)







