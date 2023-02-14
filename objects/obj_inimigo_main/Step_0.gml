//Iniciando Gravidade do inimigo;

velocidade_vertical += gravidade;
//Checando a direção~;
velocidade_horizontal = velocidade * dir;

//Iniciando a animação corretamente
if (velocidade_horizontal != 0){
	image_xscale = sign(velocidade_horizontal);}
//
if (place_meeting(x+velocidade_horizontal, y, wall_enemy))
{
	dir *= -1;
}
//Iniciando colisões do inimigo;
#region colisão horizontal
if (place_meeting(x + velocidade_horizontal, y, obj_chao))
{
	while(!place_meeting(x+sign(velocidade_horizontal), y,obj_chao))
	{
		x = x + sign(velocidade_horizontal);
	}
	velocidade_horizontal = 0;
	dir *= -1;
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

