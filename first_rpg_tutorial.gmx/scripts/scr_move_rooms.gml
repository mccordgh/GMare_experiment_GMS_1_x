/// scr_move_rooms()

if (room_exists(other.new_room)) {
    room_goto(other.new_room);
    x = other.new_x;
    y = other.new_y;
}
