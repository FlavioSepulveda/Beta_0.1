//Movimentação do player
velocidade_vertical += gravidade;
var direita, esquerda, jump;
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));
jump = keyboard_check_pressed(vk_space);

velocidade_horizontal = (direita - esquerda) * velocidade;

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

estou_no_chao = place_meeting(x, y+3, obj_chao);
if (jump)
{
	if (estou_no_chao)
	{
		velocidade_vertical -= 8;
	}
}



