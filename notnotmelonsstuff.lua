--this does nothing right now. I'm just saving it for later.

-- Custom event to check when the player opens the star map.
-- TODO: warning this is awful - "notnotmelon"
py.on_event("open-starmap", function(event)
    local player = game.get_player(event.player_index)
    if player.controller_type ~= defines.controllers.remote then return end
    local mouse_position = event.cursor_position

    local my_personal_monitor_resolution_x = 1920
    local my_personal_monitor_resolution_y = 1016
    local x_factor = my_personal_monitor_resolution_x / player.display_resolution.width
    local y_factor = my_personal_monitor_resolution_y / player.display_resolution.height

    local x = (mouse_position.x - player.render_position.x) * player.zoom * x_factor
    local y = (mouse_position.y - player.render_position.y) * player.zoom * y_factor

    local top_left_corner_x = -30
    local top_left_corner_y = -15.875

    local space_map_button_x1 = -29.4
    local space_map_button_x2 = -21.85
    local space_map_button_y1 = -13.375
    local space_map_button_y2 = -12.5

    local diff_x = top_left_corner_x - space_map_button_x1
    local width = space_map_button_x1 - space_map_button_x2
    local diff_y = top_left_corner_y - space_map_button_y1
    local height = space_map_button_y1 - space_map_button_y2

    diff_x = diff_x * x_factor * player.display_scale
    width = width * x_factor * player.display_scale
    diff_y = diff_y * y_factor * player.display_scale
    height = height * y_factor * player.display_scale
    space_map_button_x1 = top_left_corner_x - diff_x
    space_map_button_y1 = top_left_corner_y - diff_y
    space_map_button_x2 = space_map_button_x1 - width
    space_map_button_y2 = space_map_button_y1 - height
    space_map_button_x1, space_map_button_x2 = math.min(space_map_button_x1, space_map_button_x2), math.max(space_map_button_x1, space_map_button_x2)
    space_map_button_y1, space_map_button_y2 = math.min(space_map_button_y1, space_map_button_y2), math.max(space_map_button_y1, space_map_button_y2)

    local is_mouse_within_button =
        (space_map_button_x1 <= x and x <= space_map_button_x2) and
        (space_map_button_y1 <= y and y <= space_map_button_y2)

    if not is_mouse_within_button then return end

    player.exit_remote_view() -- this line is needed to avoid race condition on multiplayer
    open_map(player, nil)
end)