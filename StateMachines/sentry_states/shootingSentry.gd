extends StateSentry

var shoot_timer : float = 0

const l_shootime : float = 0.3
const r_shootime : float = 0.4
func on_enter()-> void:
	shoot_timer = randf_range(l_shootime, r_shootime)

func process(delta: float)-> void:
	var target_dir : Vector2 = p.global_position.direction_to(g.player.global_position)
	%plr_detector.target_position = target_dir * 1000
	
	shoot_timer -= delta
	if shoot_timer <= 0:
		if %plr_detect.get_overlapping_bodies().size() > 0:
			p.spawn_bullet()
		
		shoot_timer = randf_range(l_shootime, r_shootime)

func on_exit()-> void:
	pass
