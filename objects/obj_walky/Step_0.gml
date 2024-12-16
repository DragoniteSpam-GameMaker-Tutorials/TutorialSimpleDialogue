if (obj_player.currently_talking == noone) {
    if (moving) {
        var dx = dcos(move_dir);
        var dy = -dsin(move_dir);
        anim_frame = (anim_frame + 0.125) % 4;
        anim_dir = move_dir / 90;
        x += dx * 2;
        y += dy * 2;
    } else {
        anim_frame = 0;
    }
}