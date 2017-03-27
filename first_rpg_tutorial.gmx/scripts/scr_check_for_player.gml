/// scr_check_for_player()

if (instance_exists(obj_player)) {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < sight) {
        state = scr_enemy_chase_state;
        target_x = obj_player.x;
        target_y = obj_player.y;
    } else {
        scr_enemy_choose_next_state();
    }
} else {
    scr_enemy_choose_next_state();
}
