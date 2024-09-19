![](https://pbs.twimg.com/media/GUgvjl2XoAA7nyC?format=jpg&name=small)
### *Guess how many OS Engine forks I saw Marge? 160!* - Homer J. Simpson

# Friday Night Funkin' OS Engine - NEW 0.6.3 UPDATE!
![](https://img.shields.io/github/issues/FuseIsHere813/FNF-OSEngine-New) ![](https://img.shields.io/github/forks/FuseIsHere813/FNF-OSEngine-New) ![](https://img.shields.io/github/stars/FuseIsHere813/FNF-OSEngine-New) ![](https://img.shields.io/github/license/FuseIsHere813/FNF-OSEngine-New) ![GitHub all releases](https://img.shields.io/github/downloads/FuseIsHere813/FNF-OSEngine-New/total) ![GitHub repo size](https://img.shields.io/github/repo-size/FuseIsHere813/FNF-OSEngine-New) ![](https://img.shields.io/github/contributors/FuseIsHere813/FNF-OSEngine-New) ![GitHub release (latest by date)](https://img.shields.io/github/downloads/FuseIsHere813/FNF-OSEngine-New/latest/total)

## Installation:

Refer to the [Building Instructions.](https://github.com/FuseIsHere813/FNF-OSEngine-New/wiki/Library-Versions)

If you don't want your mod to be able to run .lua scripts, delete the "LUA_ALLOWED" line on Project.xml

If you get an error about StatePointer when using Lua, run `haxelib remove linc_luajit` into Command Prompt/PowerShell, then re-install linc_luajit.

## OS Engine Credits:
* [weuz_](https://github.com/notweuz) - Original Owner / Lead Programmer
* [nelifs](https://github.com/nelifs) - Main Designer / Programmer
* [Cooljer](https://github.com/cooljer) - Main Artist / Winning Icons

### OS Engine Special Thanks
* [Fuse](https://github.com/FuseIsHere813) - 0.6.3 PORT HEH-, and his smart brain for more customizable options.
* [JSE Team (Jordan Santiago/Moxie)](https://github.com/JordanSantiagoYT/FNF-JS-Engine) - For the Note Spam System in JS Engine
* [Vs. Dave And Bambi)](https://twitter.com/vsdaveandbambi) - Rainbow Eyesores/Wavy Background Code
* [ExpungedGaming6969](youtube.com/@ExpungedGaming6969) - New Ideas for Engine / Goat.
* [jonnycat](https://github.com/McJonnycat) - Fixing bugs in Engine <3.
* [Kade Engine](https://gamebanana.com/mods/44291) - Circle Note Skin.

## Psych Engine Credits:
* Shadow Mario - Programmer
* Riveren - Artist

### Psych Engine Special Thanks
* bbpanzu - Ex-Programmer
* SqirraRNG - Crash Handler and Base code for Chart Editor's Waveform
* KadeDev - Fixed some cool stuff on Chart Editor and other PRs
* iFlicky - Composer of Psync and Tea Time, also made the Dialogue Sounds
* PolybiusProxy - .MP4 Video Loader Library (hxCodec)
* Keoiki - Note Splash Animations
* Smokey - Sprite Atlas Support
* Nebula the Zorua - Old/Former LuaJIT Fork, Global Mods, Lua reworks, VCR Shader code
* superpowers04 - For the New/Current LuaJIT fork
_____________________________________

## OS Engine Features

OS Engine is a fork of [Psych Engine](https://github.com/shadowmario/psychengine/tag/0.6.2), so it does support mods, like the original.

Not only that, it brings new features for this modfication, making mods more user-friendly, and of course, more VDAB friendly too.

More features will be added later (For contribution, please make a pull request with your desired change. It will be reviewed).

### Note Skins
OS Engine adds the circle noteskin only for right, soon we will add another skin in reference to osu!mania.
Select your desired in the Options Menu.

![](./docs/img/osEngine/circle.png)

### Showcase Mode
This feature hides HUD and enables botplay. So you can showcase any mod without any problems.

![](./docs/img/osEngine/showcase.png)

### Score HUD Style
Brought back the Psych Engine look, and added the original look used from OS Engine itself.
(cry about it weuz /j)

You can select either the "Simple" or "Normal" option in the Visuals & UI section in the options menu.

![](./docs/img/osEngine/scoreHUD2.png)
![](./docs/img/osEngine/scoreHUD1.png)

### Perfect! Judgement
Adds the "Perfect!" Judgement, to get this rating, you must hit a note better than "Sick!".
Can be left/removed under the "Gameplay" section in the Options menu.

![](./docs/img/osEngine/perfect.png)

### Lane Underlay
You can set lane underlay transparency under the player's notes, transparency settings can be modified in value.
Also works with the opponent notes too somehow lo-

![](./docs/img/osEngine/underlayUGH.png)

### Custom Settings in Chart Editor.
There's multiple new functions in chart editor. Like player/opponent trail, camera move and etc.

![](./docs/img/osEngine/chartOptions.png)

### Literally Useless Exit Game State
Now you can press ESC at the title screen, and it will ask you if you wanna quit or not.

![](./docs/img/osEngine/gameExit.png)

### Improved Main Menu State

Nothing much, but kept from the latest official version. (1.5.1)

![](./docs/img/osEngine/mainMenu.png)

### Winning icons 
Instead of 2 icons, there'll be three icons (losing, normal, winning). And yes, you can use double icons (without winning).

![](./docs/img/osEngine/winIcon1.png)
![](./docs/img/osEngine/winIcon2.png)

*thanks Cooljer for remaking original fnf icons lol*

### Shaders
Shaders were re-added from VDAB, and of course, with runtime support too. Now you can all enjoy making those funni spamtrack mods lo- /j

![](./docs/img/osEngine/inGameExample.png)

### Improved Title State
Added a background to the Title State. 

"Now it looks way more better". - notweuz_ 2022

The background will be JSON editable soon, for now it can be safe to be left/removed using source code.

![](./docs/img/osEngine/title.png)

### Striped Health Bar
Cassette Girl vibes?

![](./docs/img/osEngine/strippedBar.png)
