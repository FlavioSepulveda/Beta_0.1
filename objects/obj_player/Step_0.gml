//Movimentação do player
velocidade_vertical += gravidade;
var direita, esquerda, jump;
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));
jump = keyboard_check(vk_space);

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

/*estou_no_chao = place_meeting(x, y+1, obj_chao);
if (jump)
{
	if (estou_no_chao)
	{
		velocidade_vertical -= 10;
	}
}*/

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



