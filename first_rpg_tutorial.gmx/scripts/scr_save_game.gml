/// scr_save_game()

// Check that player exists and didn't DEAD
if (!instance_exists(obj_player_stats)) exit;

// Create the save data structure
var save_data = ds_map_create();

// Store player info in our data structure created above
with (obj_player_stats) {
    save_data[? "room"] = previous_room;
    save_data[? "x"] = player_x_start;
    save_data[? "y"] = player_y_start;
    save_data[? "hp"] = hp;
    save_data[? "max_hp"] = max_hp;
    save_data[? "stamina"] = stamina;
    save_data[? "max_stamina"] = max_stamina;
    save_data[? "expr"] = expr;
    save_data[? "max_expr"] = max_expr;
    save_data[? "level"] = level;
    save_data[? "attack"] = attack;
}

// convert data structure to json file
var save_string = json_encode(save_data);

// destroy data structure made above
ds_map_destroy(save_data);

// base64 encryption on data string
save_string = base64_encode(save_string);

// open file to write data to
var file = file_text_open_write(working_directory + "save_game.txt");

// write the data
file_text_write_string(file, save_string);

// close the file
file_text_close(file);

show_message("Game Saved.");

