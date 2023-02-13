var direita, esquerda, jump, attack,jump1;
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));
jump = keyboard_check_pressed(vk_space);
jump1 = keyboard_check(vk_space);
attack = keyboard_check_pressed(ord("S"));

velocidade_vertical += gravidade;
velocidade_vertical = clamp(velocidade_vertical,-velocidade_vertical_max,velocidade_vertical_max);
velocidade_horizontal = (direita - esquerda) * velocidade;

var dir =(direita - esquerda);

velocidade_horizontal += forca_de_aceleracao * dir;
velocidade_horizontal  = clamp(velocidade_horizontal,-velocidade,velocidade);

if(dir == 0)
{
	estado ="Idle";
	velocidade_horizontal = lerp(velocidade_horizontal,0,desaceleracao);
}else{
	estado ="Andando";
}

if (velocidade_horizontal != 0){
	image_xscale = sign(velocidade_horizontal);
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
if (place_meeting(x, y+1,obj_chao))
{
	estou_no_chao = true;
}else{
	tempo++;
	if(tempo>=tempo_max)
	{
		tempo = 0;
		estou_no_chao = false;
	}
}
#region pulo beta 2
estou_no_chao = place_meeting(x,y+1,obj_chao);
if(!jump1&&velocidade_vertical<0) velocidade_vertical = max(velocidade_vertical,-altura_do_salto/2);

if (estou_no_chao)
{
	if(jump)
	{
		velocidade_vertical = velocidade_vertical - altura_do_salto;
		estou_no_chao = false;
		estado="Pulando";
	}
	}else{
		estado="Pulando";
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
}

#endregion


