//Aqui dou inicio ao screenshake em si;
/*
	O view_xport fara a tela se movimentar de esquerda para a direita;
*/
view_xport[0] = random_range (-shake , shake);
/*
	O view_yport fara a tela se movimentar de cima para baixo;
*/
view_xport[0] = random_range (-shake, shake);
//Fazendo ele aos poucos ir enfraquecendo a vibração ate se destruir por completo;
shake *= .95;
//Se o valor for menor que  0.5, então ele se auto destroi;
if (shake < .5)
{
	instance_destroy();
}