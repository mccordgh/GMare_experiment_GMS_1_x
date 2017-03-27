/// scr_move_to_target()

scr_check_for_player();

// Check that distance to target isn't greater than speed
if (point_distance(x, y, target_x, target_y) > spd) {
    // Get Direction to target (player) and move speeds
    var dir = point_direction(x, y, target_x, target_y);
    var h_speed = lengthdir_x(spd, dir);
    var v_speed = lengthdir_y(spd, dir);
    
    // Face enemy toward target
    if (h_speed != 0) image_xscale = sign(h_speed);
    
    // Move towards target
    phy_position_x += h_speed;
    phy_position_y += v_speed

}
