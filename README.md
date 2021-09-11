## Sample RPG

A sample project of Godot containing a simple movement and rolling dice system.

### How to use the Dice

To use it, just add the scene of the data in the player
and when you want to roll the dice just call the roll() function.
If you call roll() without passing any arguments it will roll 1 D20.
But it is possible to choose which dice, how many dice, the type of roll (normal, with advantage or with disadvantage) and the modifier to be added to the roll.

For example, the code: 
```python
dice = $Dice
dice.show_dice_name = False
dice.debug_log = False

result= dice.roll(100, 3, "vantage", 2)
```
It will roll 3 D100 with advantage (actually it will roll 4 dice and exclude the smallest result) and add 2 to the final sum.
Normal rolls display a blue dice, a green one with a green advantage and a red one with a disadvantage.
The variable **show_dice_name** controls whether the data name will be displayed or not, the default is false.
**debug_log** controls whether or not the data name will appear defaults to false.
And **show_time** is the time the data will be visible on the screen default is 5 seconds.

![variables](https://cdn.discordapp.com/attachments/758764113807147053/886088574208979014/unknown.png "variables")

When I press "R" on my keyboard the die is rolled and is displayed above the character.

![code_preview](https://cdn.discordapp.com/attachments/758764113807147053/886090172385603584/unknown.png "code_preview")

The result is this one:]

![Preview](https://cdn.discordapp.com/attachments/758764113807147053/886089786308300861/unknown.png "Preview")

I created these controls on the screen too so I could test and control the roll of the dice.

**Original Repo of resources:** https://github.com/uheartbeast/youtube-tutorials/blob/master/Action%20RPG/Action%20RPG%20Resources.zip

**Movement 2D tutorial from:** [HeartBeast Youtube Channel](http://https://www.youtube.com/watch?v=mAbG8Oi-SvQ&list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a "HeartBeast Channel")

**He have's a course to:** https://www.heartgamedev.com/1-bit-godot-course-youtube
