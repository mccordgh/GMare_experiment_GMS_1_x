/// scr_enemy_choose_next_state()

if (alarm[0] <= 0) {
    state = choose(scr_enemy_patrol_state, scr_enemy_idle_state);
    alarm[0] = room_speed * irandom_range(2, 4);
    target_x = random(room_width);
    target_y = random(room_height);
}
