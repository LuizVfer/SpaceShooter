
vida = 20

//variavel que controla o meu estado
estado = "carregando"

contador_tiro = 0

decidir_direcao = false

timer_carregando = game_get_speed(gamespeed_fps) 
tempo_carregando = 0

inicia_efeito_mola()
inicia_efeito_branco()
//maquina de estado
//state machine
maquina_de_estado = function()
{
	//switch variavel que eu estopou checando o valor
	switch(estado)
	{	
		case "carregando":
		{
			//eu vou parar
			vspeed = 0
			
			//ele vai esperar 3 segundos
			timer_carregando--
			if(timer_carregando < tempo_carregando)

			{
				estado = choose("atirando", "atirando2")
				
				//resetando o timer
				timer_carregando = game_get_speed(gamespeed_fps) 
			}
			//depois ele vai para o estado de atirar
			
		}
		//terminei o case eu aviso para ele parar
		break
		
		case "atirando":
		{	
			//fazer ele chegar se o player existe
			//encontrando a direçao do player
			if(instance_exists(obj_player))
			{
				var _dir = point_direction(x, y, obj_player.x, obj_player.y)
				//criando o tiro b
				var _tiro = instance_create_layer(x, y, "player_tiro", obj_tiro_inimigo3b)
				_tiro.speed = 2
				_tiro.direction = _dir
				_tiro.image_angle = _dir + 90		
				
			}
			
			efeito_som(sfx_laser2 , .1)
			contador_tiro ++
			
			contador_de_tiros()
			//atirei eu volto a carregar
			
		}
		break
		
		case "atirando2" :
		{
			//faça o tiro a dele ser criado indo para baixo
			if(instance_exists(obj_player))
			{
				var _ang = 245
				repeat(3)
				{
					//criando meu tiro
					var _tiro = instance_create_layer(x, y, "player_tiro", obj_tiro_inimigo3a)
					_tiro.speed = 4
					_tiro.direction = _ang //270 //315
					
					_ang += 25
				}
				//atirei eu volto a carregar
				efeito_som(sfx_laser2 , .1)
				contador_tiro ++
				
				contador_de_tiros()
				
				
			}
		}
		break
		
		case "fugindo":
		{
			// indo par cima
			//decidir o lado se eu ainda nao decidir um direçao
			if(!decidir_direcao)
			{
				hspeed = choose(-1, 1)
				
				decidir_direcao = true
			}
			vspeed = -1
			
			if(y < -100)
			{
				instance_destroy()
			}
			
		}
		break
	}
}


morrendo = function()
{
	//perdendo vida
	efeito_mola(2, 1)
	timer_efeito_branco(3)
	//se ele ficou sem vida	
	//e cria particula de explosao dele
	if(vida > 0)
	{
		vida --
	}
	
	else if (vida <= 0) 
	{
		drop_powerup()
		sendo_destruido(obj_explosao_inimigo)
		screenshake(20)
		efeito_som(sfx_explosion, 0.2)
	}
	
}

contador_de_tiros = function()
{
	if(contador_tiro < 11)
	{
		estado = "carregando"
	}
	else
	{
		estado = "fugindo"
	}
}