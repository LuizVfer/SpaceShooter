draw_self()

//efeito de brilho no tiro
//mudar a forma como o computador processa as cores
gpu_set_blendmode(bm_add)
//desenhando a sprite do tiro novamente por cima dela um pouco transparente
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale *1.4 , image_yscale * 1.4, image_angle, cor, 0.5)

gpu_set_blendmode(bm_normal)