///scr_attack_state()
image_speed = .6;
movement = ATTACK;

if (image_index >= 3 and !attacking) {
    switch (dir_facing) {
        case DOWN:
            xx = x;
            yy = y + 12;
            break;
    
        case UP:
            xx = x;
            yy = y - 10;
            break;
        
        case RIGHT:
            xx = x + 10;
            yy = y + 2;
            break;
        
        case LEFT:
            xx = x - 10;
            yy = y + 2;
            break;
    }

    
    var damage = instance_create(xx, yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacking = true;
}

