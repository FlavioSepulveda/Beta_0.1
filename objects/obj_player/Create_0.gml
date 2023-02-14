//Variaveis do player;
gravidade = .6;
velocidade = 4;
velocidade_vertical = 0;
velocidade_horizontal = 0;

forca_de_aceleracao = .3;
desaceleracao = .3;

altura_do_salto = 14;
estou_no_chao = false;

tempo = 0;
tempo_max = 10;
velocidade_vertical_max = 10;

vida = 5;

pode_atacar = false;
estado = "Idle";

v_cor = c_aqua;

//Metodos do player:
///@method perdi_vida();
perdi_vida = function(){
	//Fazendo eu sofrer dano;
	if(vida >= 1){
		vida --;
		screen_shake(5);
	}else{
		instance_destroy();
	}
}


