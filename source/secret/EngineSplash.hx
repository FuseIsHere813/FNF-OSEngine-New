package secret;


import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import flixel.FlxG;

class EngineSplash extends MusicBeatState
{
	var logo:FlxSprite;

	override public function create():Void
	{
		logo = new FlxSprite().loadGraphic(Paths.image('osengine'));
		logo.scrollFactor.set();
		logo.screenCenter();
		logo.alpha = 0;
		logo.active = true;
		add(logo);

		trace('splash bypassed the OPTION????! wtf');
	
		new FlxTimer().start(0.1, function(tmr:FlxTimer) {
			FlxG.sound.play(Paths.sound('holyGoof'));
			logo.scale.set(0.1,0.1);
			logo.updateHitbox();
			logo.screenCenter();
			FlxTween.tween(logo, {alpha: 1, "scale.x": 1, "scale.y": 1}, 2.09, {ease: FlxEase.expoOut, onComplete: _ -> onIntroDone()});
		});

		super.create();
	}

	function onIntroDone() {
		FlxTween.tween(logo, {alpha: 0}, 1, {
			ease: FlxEase.linear,
			onComplete: function(_) {
				FlxG.switchState(new TitleState());
			}
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}