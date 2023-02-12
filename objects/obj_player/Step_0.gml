var direita, esquerda, jump, attack;
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));
jump = keyboard_check(vk_space);
attack = keyboard_check_pressed(ord("S"));

velocidade_vertical += gravidade;
velocidade_horizontal = (direita - esquerda) * velocidade;

if (velocidade_horizontal != 0){
	image_xscale = sign(velocidade_horizontal);
	estado="Andando";
}else{
	estado="Idle";
}
#region colisão horizontal
if (place_meeting(x + velocidade_horizontal, y, obj_chao))
{
	while(!place_meeting(x+sign(velocidade_horizontal), y,obj_chao))
	{
		x = x + sign(velocidade_horizontal);
	}
	velocidade_horizontal = 0;
}
x += velocidade_horizontal;
#endregion

#region colisão vertical
if (place_meeting(x, y + velocidade_vertical, obj_chao))
{ 
	while(!place_meeting(x, y + sign(velocidade_vertical), obj_chao))
	{
		y = y + sign(velocidade_vertical);
	}
	velocidade_vertical = 0;
}
y += velocidade_vertical;
#endregion

#region pulo beta 2
estou_no_chao = place_meeting(x,y+1,obj_chao);
if (estou_no_chao)
{
	if(jump)
	{
		velocidade_vertical = velocidade_vertical - altura_do_salto;
		estado="Pulando";
	}
	}else{
		estado="Pulando";
	}
#endregion
#region Ataque
	if (attack)
	{
		estado = "Ataque";
	}
#endregion
#region maquina de estados
if (estado == "Idle")
{
	sprite_index = spr_player_idle;
}else if(estado == "Andando"){
	sprite_index = spr_player_walk;
}else if(estado == "Pulando"){
	if (velocidade_vertical < 0)
	{
	sprite_index = spr_player_jump_1;
	}
	else{
	sprite_index = spr_player_jump_2;	
	}
}else if(estado == "Ataque"){
	velocidade_horizontal=0;
	sprite_index = spr_player_attack;
}

#endregion


