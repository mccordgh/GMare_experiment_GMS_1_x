/// scr_advance_dialogue()


// Check if the Player created the damage_object (makes sure enemies don't active sign)
if (creator = obj_player.id) {
    // with the speaker object
    with (other) {
        // set font color
        draw_set_colour(c_black);
        
        // check if a dialogue instance exists
        if (!instance_exists(dialogue)) {
            // if not, create new instance and set the text array
            dialogue = instance_create(x + x_offset, y + y_offset, obj_dialogue);
            dialogue.text = text;
        } else { 
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
}
