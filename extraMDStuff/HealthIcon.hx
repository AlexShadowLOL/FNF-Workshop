package;

import flixel.FlxG;
import flixel.FlxSprite;
import lime.utils.Assets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var char:String = 'bf';
	public var isPlayer:Bool = false;
	public var isOldIcon:Bool = false;

	// Used for FreeplayState! If you use it elsewhere, prob gonna annoying
 
	public var sprTracker:FlxSprite;

	public function new(?char:String = 'bf', ?isPlayer:Bool = false)
	{
		super();

		this.char = char;
		this.isPlayer = isPlayer;

		isPlayer = isOldIcon = false;

		changeIcon(char);
		scrollFactor.set();
	}

	public function swapOldIcon()
	{
		(isOldIcon = !isOldIcon) ? changeIcon('bf-old') : changeIcon(char);
	}

	public function changeIcon(char:String)
	{
		switch (char)
		{
			default:
				char = char.split("-")[0];
		}

		if (!Assets.exists(Paths.image('icons/icon-' + char)))
			char = 'bf';

		loadGraphic(Paths.image('icons/icon-' + char), true, 150, 150);

        antialiasing = true;

		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
