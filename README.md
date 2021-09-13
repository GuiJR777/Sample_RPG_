# Sample RPG

A sample project of Godot containing a simple movement and rolling dice system.

## How to use the Dice

### Roll method

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
The variable **show_dice_name** controls whether the data name will be displayed or not, the default is false.
**debug_log** controls whether or not the data name will appear defaults to false.
And **show_time** is the time the data will be visible on the screen default is 5 seconds.

![variables](https://cdn.discordapp.com/attachments/758764113807147053/886088574208979014/unknown.png "variables")

When I press "R" on my keyboard the die is rolled and is displayed above the character.

![code_preview](https://cdn.discordapp.com/attachments/758764113807147053/886090172385603584/unknown.png "code_preview")

The result is this one:]

![Preview](https://cdn.discordapp.com/attachments/758764113807147053/886089786308300861/unknown.png "Preview")

(*I created these controls on the screen too so I could test and control the roll of the dice.*)

### Test Method

It is very common in RPG the need to perform tests with a character, defense test to see if he was able to block an attack, dexterity test to know if the acrobatics worked and etc.
With that in mind, two types of test methods were added, one in which you pass a fixed value and if the result of rolling the die is equal to or greater than the value, the test passes (returns true) otherwise it fails.
ex:
```python
var player_velocity = 20
is_the_player_fast_enough = dice.test(mid_value=40, faces=20, amount=3, "normal", player_velocity)
```

In the example above the player needs to take at least 20 in the sum of the 3 dice since the result will be added to his speed which is already 20 and he needs at least 40 to pass the test.
And the second method that uses percentage. You must pass to this method a number from 1 to 100 that will correspond to the failure chance percentage. For example if the test is called passing 70, the player has only 30% success in this test.

```python
var player_force = 8
Is_the_player_able_to_hold_onto_the_edge = dice.test_with_percentage(dificulty=70, faces=20, amount=3, "normal", player_force)
```

In the example above, 3 dice will be rolled to check if the player can hold on, he has a 30% chance of doing so, which means he needs to roll more than 34 in the sum of the dice since his strength is 8 and the average value it was 42 (faces x amount of dices x difficulty / 100).

**Original Repo of resources:** https://github.com/uheartbeast/youtube-tutorials/blob/master/Action%20RPG/Action%20RPG%20Resources.zip

**Movement 2D tutorial from:** [HeartBeast Youtube Channel](http://https://www.youtube.com/watch?v=mAbG8Oi-SvQ&list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a "HeartBeast Channel")

**He have's a course to:** https://www.heartgamedev.com/1-bit-godot-course-youtube
