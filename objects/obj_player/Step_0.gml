//Movimentação do player
velocidade_vertical += gravidade;
var direita, esquerda, jump, attack;
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));
jump = keyboard_check(vk_space);
attack = keyboard_check_pressed(ord("S"));
velocidade_horizontal = (direita - esquerda) * velocidade;

//Ataque;


//Colisão
if (place_meeting(x + velocidade_horizontal, y, obj_chao))
{
	//While Para loops;
	while(!place_meeting(x+sign(velocidade_horizontal), y,obj_chao))
	{
		x = x + sign(velocidade_horizontal);
	}
	velocidade_horizontal = 0;
}
x += velocidade_horizontal;
if (place_meeting(x, y + velocidade_vertical, obj_chao))
{ 
	while(!place_meeting(x, y + sign(velocidade_vertical), obj_chao))
	{
		y = y + sign(velocidade_vertical);
	}
	velocidade_vertical = 0;
}
y += velocidade_vertical;

if (place_meeting(x,y+1,obj_chao)) && (jump)	//Se eu estiver no chão e o pulo for verdadeiro;
{
	altura_do_salto = 0.1; //Altura do salto sera esse valor;
	velocidade_vertical = velocidade_do_salto * altura_do_salto;
	estou_no_chao = true;
}
if (!jump)
{
	estou_no_chao = false;
}
else if(altura_do_salto < .5 && jump)
{
	altura_do_salto+= .05;
	velocidade_vertical = -velocidade_do_salto * altura_do_salto;
}
#region mudança de sprite
//Mudando a Animação do player;
if(!place_meeting(x,y+1,obj_chao)) //Se ele estiver no ar;
{
	sprite_index = spr_player_jump;	//O sprite dele sera esse;
	image_speed = 0;
	if (velocidade_vertical>0)
	{
		image_index = 1;
	}
	else 
	{
		image_index = 0;
	}
}
else
{
	image_speed = 1;
	if (velocidade_horizontal == 0 && pode_atacar)
	{
		sprite_index = spr_player;
	}
	else if(pode_atacar)
	{
		sprite_index = spr_player_wak;
	}
	if(pode_atacar && attack)
	{
		pode_atacar = false;
		sprite_index = spr_player_attack;
		alarm[0]=room_speed/2;
	}
	
	
}
if (velocidade_horizontal != 0) 
{
	image_xscale = sign(velocidade_horizontal);
}

#endregion

#region//Maquina de estados
/*switch(estado) //Switch é um comando qu
{

	case "Parado":
	{
		//Comportamento do estado
		sprite_index = spr_player;
		if (esquerda or direita)
		{
			estado = "Movendo";
		}
		break;
	}
	case "Movendo":
	{
		//Comportamento do estado
		sprite_index = spr_player_wak;
		if (esquerda or direita)
		{
			estado = "Movendo";
		}
		break;
	}

}*/
#endregion

