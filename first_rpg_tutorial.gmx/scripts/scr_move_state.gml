///scr_move_state()
movement = MOVE;

// check for Dash key press
if (obj_input.dash_key) {
    // Check for nearby sign
    var x_dir = lengthdir_x(8, dir_facing * 90);
    var y_dir = lengthdir_y(8, dir_facing * 90);
    var speaker = instance_place(x + x_dir, y + y_dir, obj_speaker);
    // If nearby sign exists, talk to it
    if (speaker != noone) {
        with (speaker) {
            // set font color
            draw_set_colour(c_black);
            
            // check if a dialogue instance exists
            if (!instance_exists(dialogue)) {
                 // if not, create new instance and set the text array
                dialogue = instance_create(x + x_offset, y + y_offset, obj_dialogue);
                dialogue.speaking = true;
                dialogue.text = text;
            } else if (instance_exists(dialogue) and !dialogue.speaking){ 
                dialogue.speaking = true;
                // else, go to the next page
                dialogue.text_page++;
                dialogue.text_count = 0;
    
                // check if you've seen the last page, and if so set text_page to 0
                if (dialogue.text_page > array_length_1d(dialogue.text) - 1) {
                    with (dialogue) {
                        instance_destroy();
                    }
                }
            }
        }        
    // else DASH
    } else if (obj_player_stats.stamina >= DASH_COST) {
        obj_player_stats.stamina -= DASH_COST;
        state = scr_dash_state;
        alarm[0] = room_speed/5;
        obj_player_stats.alarm[0] = room_speed * 2;  
    }
}

// Check for attack key press
if (obj_input.attack_key) {
    image_index = 0;
    state = scr_attack_state;
}

// Check for spell key press
if (obj_input.spell_key) {
    // create projectile
    var projectile = instance_create(x, y, obj_projectile);
    // calculate and apply force to projectile
    var x_force = lengthdir_x(10, dir_facing * 90);
    var y_force = lengthdir_y(10, dir_facing * 90);
    projectile.creator = id;
    with (projectile) physics_apply_impulse(x, y, x_force, y_force);
}


// Get direction
dir = point_direction(0, 0, obj_input.x_axis, obj_input.y_axis);

// Get length of move
if (obj_input.x_axis == 0 and obj_input.y_axis == 0) {
    len = 0;
} else {
    len = spd;
    scr_get_dir_facing();
}

// Get h and v speeds
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move
phy_position_x += hspd;
phy_position_y += vspd;

// Control the sprite
image_speed = .2;
if (len == 0) image_index = 0;

