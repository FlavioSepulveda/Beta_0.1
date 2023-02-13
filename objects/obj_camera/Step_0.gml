if(instance_exists(obj_player))
{
x = lerp(x,obj_player.x - (cam_largura/2), 0.1)
y = lerp(y,obj_player.y - (cam_altura/2),0.1)

x = clamp(x,0,room_width - cam_largura);
y = clamp(y,0,room_height - cam_altura);
}
camera_set_view_pos(view_camera[0], x, y);