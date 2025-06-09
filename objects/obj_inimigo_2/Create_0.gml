alarm[0] = game_get_speed(gamespeed_fps) * 2 

//descobrindo se eu fui criado em uma sequencia
criado_em_sequence = in_sequence

vida = 3

inicia_efeito_mola()
inicia_efeito_branco()

atirando = function()
{
	efeito_som(sfx_laser2 , .1)
	var _tiro = instance_create_layer(x + 10, y, "player_tiro", obj_tiro_inimigo_2)
	_tiro.vspeed = 6
	var _tiro = instance_create_layer(x - 10, y, "player_tiro", obj_tiro_inimigo_2)
	_tiro.vspeed = 6
}

morrendo = function()
{
	var _chance = random(100);
	//perdendo vida
	efeito_mola(2, 1)
	timer_efeito_branco(3)
	//se ele ficou sem vida	
	//e cria particula de explosao dele
	if(vida > 1)
	{
		vida --
	}
	
	else if (vida <= 1) 
	{
		
		if(_chance > 60)
		{
			drop_powerup()
		}
		sendo_destruido(obj_explosao_inimigo)
		screenshake(5)
		efeito_som(sfx_explosion, 0.2)
	}
	
}