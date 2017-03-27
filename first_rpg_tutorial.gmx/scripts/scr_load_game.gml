/// scr_load_game()

// open save file
var file = file_text_open_read(working_directory + "save_game.txt");

// get entire file as string
var save_string = file_text_read_string(file);

// close file
file_text_close(file);

// decode loaded string
save_string = base64_decode(save_string);

// convert from json to data structure
var save_data = json_decode(save_string);

// grab details from the data structure

// navigate to room if current room is not the saved room
var save_room = save_data[? "room"];
if (room != save_room) room_goto(save_room);

// load in player stats
with (obj_player_stats) {
    // player starting position
    player_x_start = save_data[? "x"];
    player_y_start = save_data[? "y"];

    // set positions
    if (instance_exists(obj_player)) {
        obj_player.x = player_x_start;
        obj_player.y = player_y_start;
        obj_player.phy_position_x = player_x_start;
        obj_player.phy_position_y = player_y_start;
    } else {
        instance_create(player_x_start, player_y_start, obj_player);
    }

    // set players stats from loaded data
    hp = save_data[? "hp"];
    max_hp = save_data[? "max_hp"];
    stamina = save_data[? "stamina"];
    max_stamina = save_data[? "max_stamina"];
    expr = save_data[? "expr"];
    max_expr = save_data[? "max_expr"];
    level = save_data[? "level"];
    attack = save_data[? "attack"];
}

// destroy loaded data structure
ds_map_destroy(save_data);



