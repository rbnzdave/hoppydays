extends AnimatedSprite

func update(motion, dying):
	
	if dying:
		play("hurt")
	else:
		if motion.y < 0:
			flip_h = motion.x < 0
			play("jump")
		elif motion.x != 0:
			flip_h = motion.x < 0
			play("run")
		else:
			flip_h = false
			play("idle")
