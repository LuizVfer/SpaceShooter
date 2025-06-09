//Jogar, Tutorial, Sair


//criando um array para as opçoes do menu
menu = ["Jogar", "Tutorial", "Sair"]

atual = 0

margem = 30

controla_menu = function()
{
	if(keyboard_check_pressed(vk_down))
	{
	
		atual ++
		audio_stop_sound(sfx_zap)
		audio_play_sound(sfx_zap, 0, 0)
		margem = 0
	
	}

	if(keyboard_check_pressed(vk_up))
	{
		atual --
		audio_stop_sound(sfx_zap)
		audio_play_sound(sfx_zap, 0, 0)
		margem = 0
	}

	atual = clamp(atual, 0, array_length(menu) - 1 )

	margem = lerp(margem, 30, 0.1)
	
	//checando se a pessoa apertou o enter
	if(keyboard_check_pressed(vk_enter))
	{
		ativa_menu()
	}

}

ativa_menu = function()
{
	//fazendo o menu funcionar
	switch(atual)
	{
		//jogar
		case 0:
		{
			//chamando a transicao 1
			layer_sequence_create("sq_transicao", room_width /2, room_height /2, sq_transicao1)
			
			//o destino é a tela de jogo
			global.destino = rm_jogo
			
			
			// esta tendo uma transicao
			global.transicao = true;
			
		}
		break
		//tutorial
		case 1:
		{
			//chamando a transicao 2
			layer_sequence_create("sq_transicao", room_width /2, room_height /2, sq_transicao1)
			
			//o destino é a tela de jogo
			global.destino = rm_tutorial	
			
			// esta tendo uma transicao
			global.transicao = true;
		}
		break
		//sair
		case 2:
		{
			//fechando o jogo
			game_end()
		}
		break
	}
}

desenha_menu = function()
{
	//pegue as dimensones da tela
	//desenhe o texto no meio da tela

	var _meio_tela = display_get_gui_height()/2.5

	draw_set_valign(1)

	draw_set_font(fnt_menu)
	var _alt = string_height("I")
	//desenhando a opcao de jogar do meu menu
	//usando um laço de repetiçao para desenhar toda as opçoes do menu
	//laço de reptiçao for usar um indice, uma condiçao de repetiçao, e uma açao
	// meu indice começa com o valor de 0
	//minha condiçao é enquanto o i for menor de que 3
	// ao repetir ele vai aumenrtar o valor de i em 1

	for (var i = 0; i < array_length(menu); i++)
	{
		var _cor = c_white
	
		var _marg = -10
	
		if(i == atual)
		{
			_cor = c_red
		
			_marg = margem
		
		}
		//vou avisar pra ele que a opçao atual fica na cor vermelha
		//checando se o I é igual a minha opçao atual
		draw_set_color(_cor)
		draw_text(20 + _marg, _meio_tela + i * _alt, menu[i])
		draw_set_color(-1)
	}

	draw_set_valign(-1)
	draw_set_font(fnt_menu)

}