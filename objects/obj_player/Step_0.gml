var dx = 0, dy = 0;

running = false;

if (currently_talking == noone) {
    if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
        dx = -1;
    }
    if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
        dx = 1;
    }
    if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        dy = -1;
    }
    if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        dy = 1;
    }
}

if (dx != 0 || dy != 0) {
    var mag = point_distance(0, 0, dx, dy);
    if (keyboard_check(vk_shift)) {
        running = true;
        mag /= 1.5;
    }
    dx /= mag;
    dy /= mag;
    anim_frame = (anim_frame + 0.125) % 4;
    anim_dir = point_direction(0, 0, dx, dy) / 90;
} else {
    anim_frame = 0;
}

x += dx * 2;
y += dy * 2;

if (dx != 0 || dy != 0) {
    if (!audio_is_playing(se_footstep)) {
        audio_play_sound(se_footstep, 100, false);
    }
}

if (keyboard_check_pressed(vk_space)) {
    if (currently_talking == noone) {
        var check_x = lengthdir_x(32, anim_dir * 90) + x;   // 32 * dcos(angle)
        var check_y = lengthdir_y(32, anim_dir * 90) + y;   // -32 * dsin(angle)
        var who_is_here = instance_place(check_x, check_y, obj_walky);
        if (who_is_here != noone) {
            current_text = who_is_here.text[0];
            currently_talking = who_is_here;
            current_text_index = 0;
            current_text_line_number = 0;
        }
    } else {
        if (current_text_line_number < array_length(currently_talking.text) - 1) {
            current_text_line_number++;
            current_text = currently_talking.text[current_text_line_number];
            current_text_index = 0;
        } else {
            currently_talking = noone;
        }
    }
}