//Criando a GUI;
//Informações que devem ser mostradas:
/*
	Vidas;
	Mana - se tiver;
	Dentre outros;
*/

//Pedindo a ele que desenhe uma barra de vida na tela;
//Desenhando a quantidade de vida uma do lado da outra;

var multi = 0;
var espaco = 40;
repeat(vida)
{
	draw_sprite_ext(spr_soul_points, 0, 40 + espaco * multi, 50, 2,2,0,c_white,.7);
	multi++;
}
multi = 0;