// controlando o player

controla_player();

if(keyboard_check_released(vk_tab))
{
	global.debug = !global.debug
}

////sempre que eu aperta enter o jogador perde vida 1 de vida
//if(keyboard_check_released(vk_enter))
//{
//	perde_vida()
//}


//se o jogado ficar com 0 ou menos vida
//ele é destruido

//mudando o valor do level do meu tiro
//se eu apertei para cima o level do tiro diminiu
//if(keyboard_check_pressed(vk_control))
//{
//	level_tiro --
//}

//se eu apertei para baixo o level do tiro aumenta
//if(keyboard_check_pressed(vk_shift))
//{
//	level_tiro ++
//}
//crie um debug do level do tiro
//crie esse debug no evento draw
//use um draw text para desenha na tela o level do tiro

//se eu tiver escudo, eu faço ele ficar na minha posiçao
//se existir uma instancia do meu escudo, eu movo ele

retornar_mola(.4)

contador_efeito_branco()

//if(keyboard_check(vk_backspace)) room_restart()

