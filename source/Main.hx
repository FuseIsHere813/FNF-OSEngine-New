package;

import secret.EngineSplash;
import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import openfl.Assets;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.StageScaleMode;

//crash handler stuff
#if CRASH_HANDLER
import lime.app.Application;
import openfl.events.UncaughtErrorEvent;
import haxe.CallStack;
import haxe.io.Path;
import Discord.DiscordClient;
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;
#end

using StringTools;

class Main extends Sprite
{
	var game = { // credit to crowplexus for this variable array.
		width: 1280, // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
		height: 720, // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
		initialState: TitleState, // The FlxState the game starts with.
		zoom: -1.0, // If -1, zoom is automatically calculated to fit the window dimensions
		framerate: 60, // How many frames per second the game should run at.
		skipSplash: true, // Whether to skip the flixel splash screen that appears in release mode.
		startFullscreen: false // Whether to start the game in fullscreen on desktop targets
	};

	public static var fpsVar:FPS;

	// You can pretty much ignore everything from here on - your code should go in your states.

	public static var awesomeCoolSecret:Array<String> = [
		"whatthefridge",
		"aw don't worry it's gonna be fin- wait...",
		"are you sirius rwight neow?",
		"oh... that's a null object reference :frowning2:",
		"have you ever heard of null function reference's brother named null lua refernce?",
		"oh shit it's a null reference NOOOOOOOOO",
		"pain",
		"did you forget a comma??? womp womp /j",
		"womp womp vro",
		":broken_heart:",
		"my bad, i feel disappointed too",
		"so you see... after the engine crashed i had no bitches",
		"hi fellow lime test windows user!",
		"psst.. this engine is the community update for os..."
	];

	public static function main():Void
	{
		Lib.current.addChild(new Main());
	}

	public function new()
	{
		super();

		dubBossman();

		if (stage != null)
		{
			init();
		}
		else
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(?E:Event):Void
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}

		#if (flixel >= "5.3.0")
		#if (haxe < "4.2.5")
		#error '"OS Engine 1.6" is not compatible with Haxe versions older than 4.2.5 when using Flixel 5.3, use Flixel 5.2.2 or lower.'
		#end // flixel 5.3 support because y'all be tweaking with 4.2.4 😜
		#end

		setupGame();
	}

	
	public function dubBossman() // testing shit
		{
			#if (flixel < "5.2.2")
			trace('i think you deserve a huge W blud (flixel 5.2.2 or below found)');
			#if (haxe < "4.2.5")
			trace('nice haxe version (4.2.4 or below found)');
			#end
			#end
		}

	private function setupGame():Void
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;

		if (game.zoom == -1)
		{
			var ratioX:Float = stageWidth / game.width;
			var ratioY:Float = stageHeight / game.height;
			game.zoom = Math.min(ratioX, ratioY);
			game.width = Math.ceil(stageWidth / game.zoom);
			game.height = Math.ceil(stageHeight / game.zoom);
		}
	
		ClientPrefs.loadDefaultKeys();
		addChild(new FlxGame(game.width, game.height, game.initialState, #if (flixel < "5.0.0") game.zoom, #end game.framerate, game.framerate, game.skipSplash, game.startFullscreen));

		#if !mobile
		fpsVar = new FPS(10, 3, 0xFFFFFF);
		addChild(fpsVar);
		Lib.current.stage.align = "tl";
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		if(fpsVar != null) {
			fpsVar.visible = ClientPrefs.showFPS;
		}
		#end

		#if html5
		FlxG.autoPause = false;
		FlxG.mouse.visible = false;
		#end
		
		#if CRASH_HANDLER
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
		#end
	}

	// Code was entirely made by sqirra-rng for their fnf engine named "Izzy Engine", big props to them!!!
	// very cool person for real they don't get enough credit for their work
	#if CRASH_HANDLER
	function onCrash(e:UncaughtErrorEvent):Void
	{
		var errMsg:String = "";
		var theStack:String = "";
		var path:String;
		var callStack:Array<StackItem> = CallStack.exceptionStack(true);
		var dateNow:String = Date.now().toString();

		dateNow = dateNow.replace(" ", "_");
		dateNow = dateNow.replace(":", "'");

		path = "./crash/" + "OSEngine_" + dateNow + ".txt";

		for (stackItem in callStack)
		{
			switch (stackItem)
			{
				case FilePos(s, file, line, column):
					theStack += file + " (line " + line + ")\n";
					errMsg = theStack;
				default:
					Sys.println(stackItem);
			}
		}
		
		//Application.current.window.alert(errMsg, "Error!");

		errMsg += "\nUncaught Error: " + e.error + "\nPlease report this error to the GitHub page: https://github.com/FuseIsHere813/FNF-OSEngine-New\n\n> Crash Handler written by: sqirra-rng";

		if (!FileSystem.exists("./crash/"))
			FileSystem.createDirectory("./crash/");

		File.saveContent(path, 
			"Error! (" + Main.awesomeCoolSecret[FlxG.random.int(0, Main.awesomeCoolSecret.length)] + ")\n" + errMsg + "\n");

		Sys.println("Uncaught Exception! (" + 
		Main.awesomeCoolSecret[FlxG.random.int(0, Main.awesomeCoolSecret.length)] + ")\n");
		Sys.println(e.error + "\n");
		Sys.println(theStack);
		Sys.println("The engine has saved a crash log to " + Path.normalize(path) + ".\nSend that when making a GitHub issue necessarily!"); // Command Prompt Error Log: Overhauled

		Application.current.window.alert(errMsg, "Error!" + " OS Engine v" + MainMenuState.osEngineVersion);
		DiscordClient.shutdown();
		Sys.exit(1);
	}
	#end
}

#if nothing
	/*var gameWidth:Int = 1280; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 720; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var initialState:Class<FlxState> = TitleState; // The FlxState the game starts with.
	var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var framerate:Int = 60; // How many frames per second the game should run at.
	var skipSplash:Bool = true; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets*/
#end
