#region globais
global.debug = false



//definido destiono que a minha transicao vai levar
global.destino = rm_inicio

global.transicao = false


#endregion

#region funçoes

function sendo_destruido(_particula = obj_explosao_tiro)
{
	instance_destroy()
	//criando a minha particula
	instance_create_layer(x, y, "particulas", _particula)
	
}

//funçao de screenshake
function screenshake(_treme = 1)
{
	//checando se a instancia screenshake existe
	if(instance_exists(obj_screenshake))
	{
		
		//checando se o valor de treme atual é maior do que o treme do objeto screenshake
		with (obj_screenshake)
		{
			//meu codigo vai rodar dentro desse objeto
			//se o treme novo for maior do que eu estou tremendo
			// ai eu mudo o valor dele, caso o contrario eu nao faço nada
			if(_treme > treme)
			{
				
			}
			treme = _treme
		}
		
	}
}

function drop_powerup()
{
	var _drop_powerup = choose(obj_powerup, obj_powerup_2, obj_powerup_3, obj_powerup_4, obj_powerup_5)
	instance_create_layer(x, y, layer, _drop_powerup)
}

function inicia_efeito_mola()
{
	//iniciado as variaveis q eu vou usar
	xscale = 1
	yscale = 1
}

// ele vai definir o efeito amassar
function efeito_mola(_xscale = 1, _yscale = 1)
{
	xscale = _xscale
	yscale = _yscale
}

function retornar_mola(_qtd = .1)
{
	xscale = lerp(xscale, 1, _qtd)
	yscale = lerp(yscale, 1, _qtd)

}

function desenha_efeito_mola()
{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
}



function inicia_efeito_branco()
{
	tomei_dano = false
}

function timer_efeito_branco(_tempo = 1)
{
	tomei_dano = _tempo
}

function contador_efeito_branco()
{
	if(tomei_dano > 0)
	{
		tomei_dano--
	}
}

function desenha_efeito_branco(_funcao_desenho = draw_self())
{
	if (tomei_dano)
	{
		shader_set (sh_branco)
		_funcao_desenho()
		shader_reset()
	}
	else
	{
		_funcao_desenho()
	}
	
}

function efeito_som(_som = sfx_laser1, _variacao = .1)
{
	var _pitch = random_range(1 -_variacao, 1 + _variacao)
	audio_play_sound(_som, 0, 0, , , _pitch)
}

//funcao para mudar de room
function muda_room_transicao()
{
	room_goto(global.destino)
	
	//garanto que nao tem som nenhum tocando
	audio_stop_all()
}

function finaliza_transicao()
{
	global.transicao = false
}

function fase_completa()
{
	global.destino = rm_inicio
	global.transicao = true
	layer_sequence_create("sq_transicao", room_width /2, room_height /2, sq_transicao1)
	
}
#endregion