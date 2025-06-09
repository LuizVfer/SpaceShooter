alarm[0] = game_get_speed(gamespeed_fps) * 2 


//descobrindo se eu fui criado em uma sequencia
criado_em_sequence = in_sequence

//metodo de atirar
atirando = function()
{
	efeito_som(sfx_laser2 , .1)
	var _tiro = instance_create_layer(x, y, "player_tiro", obj_tiro_inimigo_1)
	_tiro.vspeed = 4
}

morrendo = function()
{
	sendo_destruido(obj_explosao_inimigo)
	
	var _chance = random(100);
	
	screenshake(20)
	
	//explodindo
	efeito_som(sfx_explosion, .1)
	//criando o power up
	//se o chance for maior do que 90, ele cria o power up
	if(_chance > 80)
	{		
		drop_powerup()
	}
	
}