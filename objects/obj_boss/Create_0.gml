vida = 100

//variavel que controla o meu estado
estado = "chegando"

decidir_direcao = false

timer_carregando = game_get_speed(gamespeed_fps) /2
tempo_carregando = 0

xscale = 3
yscale = 2
inicia_efeito_branco()

//maquina de estado
//state machine

maquina_de_estado = function()
{
	//switch variavel que eu estopou checando o valor
	switch(estado)
	{
		//casos estado chegando
		case "chegando":
		{
			//enquanto o y dele for menor do que 160
			//ele vai ir para baixo
			//senao ele da um show message falando que cheguei
			if(y < 130)
			{
					vspeed = 2
			}
			else // meu Y nao é menor q 160
			{
				//terminei de chegar eu mudo de estado
				estado = "carregando"
			}
		}
		//acabei o estado de case
		break
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
				timer_carregando = game_get_speed(gamespeed_fps) /2
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
				_tiro.speed = 5
				_tiro.direction = _dir
				_tiro.image_angle = _dir + 90		
				
			}
			
			efeito_som(sfx_laser2 , .1)
		
			estado = "carregando"
			
		}
		break
		case "atirando2" :
		{
			//faça o tiro a dele ser criado indo para baixo
			if(instance_exists(obj_player))
			{
				var _ang = 195
				repeat(7)
				{
					//criando meu tiro
					var _tiro = instance_create_layer(x, y, "player_tiro", obj_tiro_inimigo3a)
					_tiro.speed = 4
					_tiro.direction = _ang //195 //220 //245 //270 //315 //340 //365				
					_ang += 25
				}
				//atirei eu volto a carregar
				efeito_som(sfx_laser2 , .1)
				estado = "carregando"		
			}
		}
		break
	}
}

morrendo = function()
{
	//perdendo vida
	efeito_mola(3, 2)
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
		screenshake(50)
		efeito_som(sfx_explosion, 0.2)
		layer_sequence_create(layer, 144 , 256, sq_fasecompleta)
		
	}
	
}