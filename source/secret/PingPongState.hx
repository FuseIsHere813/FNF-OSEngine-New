package secret;

#if PINGPONG_ALLOWED

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
#if (flixel_addons >= "3.0.0")
import flixel.util.FlxAxes;
#end

class PingPongState extends MusicBeatState {
    override function create() {

        FlxG.mouse.visible = true;

        var nextMessage:Void->Void = null;

        var i:Int = -1;
        var popup = [
            "do you want to play pingpong",
            "trust me it's fun",
            "please :(",
            "OK THATS IT.",
            "3 seconds until Null steals your liver.",
            "Fine."
        ];
    
        nextMessage = function() {
            i++;
            if (i >= popup.length) {
                dieASDF();
            } else {
                openSubState(new Prompt(popup[i], 0, function() {nextMessage();}, null, false, "No.", "No."));
            }
        }
        
        nextMessage();

        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.scrollFactor.set();
		bg.color = 0xFF222222;
		add(bg);
        }

        function dieASDF()
        {
            trace('tf it crashed the game what');
            var e:MusicBeatState = null;
            @:privateAccess
            e.update(0);
        }
    }

#end