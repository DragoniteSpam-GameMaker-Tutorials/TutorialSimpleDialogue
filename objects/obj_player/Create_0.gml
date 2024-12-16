event_inherited();

running = false;

if (!audio_is_playing(bgm_idle_with_accordions)) {
    audio_play_sound(bgm_idle_with_accordions, 100, true);
}

current_text = "";
currently_talking = false;