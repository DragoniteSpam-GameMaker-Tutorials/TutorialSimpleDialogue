if (currently_talking == true) {
    var x1 = 0;
    var y1 = window_get_height() - 160;
    var x2 = window_get_width();
    var y2 = window_get_height();
    
    draw_set_color(c_white);
    draw_rectangle(x1, y1, x2, y2, false);
    
    var text_x = x1 + 32;
    var text_y = y1 + 32;
    
    draw_set_color(c_black);
    draw_text(text_x, text_y, current_text);
}