extends Node2D

var story = [
	'One day, the rabbit was boasting of his speed.  “I have never yet been beaten,” said he, "when I put forth my full speed. I challenge any one here to race with me. I am the best.”He was hopping up and down.',
	'The turtle said quietly, "I accept your challenge. I am tired of your bragging. I am confident that I can beat you.”  The turtle looked around with her sleepy eyes and saw that the other animals were smiling.',
	'That is a good joke," said the rabbit.  "I could dance around you all the way. You will never speed past me!" "Keep your boasting till you have beaten me, answered the turtle. Shall we race? I know that I can defeat you.',
	'So they set a route for the race.  It went through hills and rocky paths.  It had rained, so the rocks were slippery.',
	'They were off!  The rabbit darted speedily almost out of sight at once, but soon stopped to rest.  He believed that the turtle could never catch him.  “I’m going to lie down by some bushes at the top of this hill to have a nap,” he said to himself. The turtle kept racing, slowly but surely on his way to the goal.',
	'Then a noise woke the rabbit woke from his nap.  The snail and frog and other animals were all cheering loudly.  He saw the turtle was near the finish line. The rabbit ran as fast as he could, but it was too late. He saw the turtle had reached the goal. He was very surprised. He had never lost a race.',
	'“Ha, ha,” I said. “I knew that my friend would win.  The turtle is strong and steady. You are fast, but you didn’t think about how hard the turtle would try.  I knew he would try harder than you.  I know a lot.  That’s why people say owls are wise birds.”  The other animals smiled.',
	'Then the rabbit said, “I have learned a lesson today.”'
]

var index = 0

func _ready():
	get_node("Control/Label").text = story[0]
	get_node("Control").visible = false

func _on_Close_pressed():
	get_node("AnimationPlayer").play("Hide")	
	get_node("Show").disabled = false
	index = 0


func _on_Show_pressed():
	get_node("Control").visible = true
	get_node("Show").disabled = true
	get_node("AnimationPlayer").play("Show")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Hide":
		get_node("Control").visible = false
	

func _on_Previous_pressed():
	index -= 1
	if not index < 0:
		get_node("Control/Label").text = story[index]
	else:
		index = 0


func _on_Next_pressed():
	index += 1
	if not index > len(story) -1:
		get_node("Control/Label").text = story[index]
	else:
		index = len(story) -1
