//Pedindo pra ele se desenhar na tela;
draw_self();
//Pedindo para que a GPU processe o brilho de uma maneira melhor;
gpu_set_blendmode(bm_add);
//Desenhando o brilho ao redor dele;
draw_sprite_ext(spr_brilho_2, image_index, x, y, image_xscale/2, image_yscale/2, image_angle,v_cor, .2);
//Pedindo pra ele resetar o estilo de processamento de brilho na tela;
gpu_set_blendmode(bm_normal);