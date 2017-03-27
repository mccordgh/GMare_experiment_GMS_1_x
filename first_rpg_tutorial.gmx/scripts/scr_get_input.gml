///scr_get_input()

//set keyboard key values
right_key = keyboard_check(ord('D'));
left_key = keyboard_check(ord('A'));
up_key = keyboard_check(ord('W'));
down_key = keyboard_check(ord('S'));
dash_key = keyboard_check(ord('J'));
attack_key = keyboard_check(ord('K'));
pause_key = keyboard_check_pressed(vk_escape);
spell_key = keyboard_check_pressed(ord('L'));

// Get the axis
// This returns 1 if either key pressed, and 0 if both or no keys pressed
x_axis = (right_key - left_key);
y_axis = (down_key - up_key);

// Check for gamepad input
gamepad = -1
if (gamepad_is_connected(0)) gamepad = 0;
if (gamepad_is_connected(4)) gamepad = 4;
if (gamepad >= 0) {
    gamepad_set_axis_deadzone(gamepad, .35);
    x_axis = gamepad_axis_value(gamepad, gp_axislh);
    y_axis = gamepad_axis_value(gamepad, gp_axislv);
    dash_key = gamepad_button_check_pressed(gamepad, gp_face1);
    attack_key = gamepad_button_check_pressed(gamepad, gp_face2);
    spell_key = gamepad_button_check_pressed(gamepad, gp_face3);
    pause_key = gamepad_button_check_pressed(gamepad, gp_start);
}
