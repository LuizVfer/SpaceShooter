//fazando o sistema de movimentaçao do jogador
//metodo de controlar o player

// eu vou apra de tocar todos os sons
//tocando a musica do jogo
audio_stop_all()
//audio_stop_sound(snd_musica)
audio_play_sound(musica_fundo, 0, 1)

//iniciando minhas variaveis
#region variaveis
vel = 2

//vidas
vidas = 3
//escudos
escudos = 5

meu_escudo = noone

vel_tiro = -5

//variavel da espera do tiro
espera_tiro = 10
//variavel do timer do tiro
timer_tiro = 0
//level do meu tiro
level_tiro = 1

//variavel do desenho da sprite
xscale = 1
yscale = 1

inicia_efeito_branco()

//criando um timer de invencibilidade 1 segundo
//o player so pode perder vida se ele nao esta invencivel 
//ele nao está invencivel se o timer de invencibilidade for igual a 0
tempo_invencivel = game_get_speed(gamespeed_fps)
timer_invencivel = 0



#endregion

#region metodos

controla_player = function()
{
	//dimininuindo o timer invencivel
	timer_invencivel--
	
	//pegando as teclas
	var _cima, _baixo, _esq, _dire, _atirar;
	
	//para cima é a letra W
	_cima = keyboard_check(ord("W")) || keyboard_check(vk_up)
	//para baixo é a letra S
	_baixo = keyboard_check(ord("S")) || keyboard_check(vk_down)
	//para direita é a letra D
	_dire = keyboard_check(ord("D")) || keyboard_check(vk_right)
	//para esquerda é a letra A
	_esq = keyboard_check(ord("A")) || keyboard_check(vk_left)
	//para atirar é o espaço
	_atirar = keyboard_check(vk_space) || mouse_check_button(mb_left)
	//if (_cima == true) y -= vel

	//if (_baixo == true) y += vel

	//if (_dire == true) x += vel	

	//if (_esq == true) x -= vel	

	var _velh = (_dire - _esq) * vel;
	x += _velh
	
	//impediondo que o jogador saia pela esquerda
	//if (x<=sprite_width/2) x = sprite_width/2
	//impediondo que o jogador saia pela direita
	//if (x >= room_width - sprite_width/2) x = room_width - sprite_width/2

	//limitando a posiçao horizontal do player
	x = clamp(x, sprite_width/2, room_width - sprite_width/2 )
	
	var _velv = (_baixo - _cima ) * vel;
	y += _velv
	
	//limitando a posiçao vertical do player
	y = clamp(y, sprite_height/2, room_height - sprite_height/2)
	
	if(keyboard_check_released(ord("E")))
	{
		usa_escudo()	
	}	
	
	com_escudo()
	
	//diminuindo o timer do tiro
	timer_tiro --;
	
	//sempre que o jogador apertar a tecla de tiro, ele vai criar um tiro
	if (_atirar && timer_tiro <= 0 )
	{
		//mudando o tamanho do player
		efeito_mola(.8, 1.2)
		
		audio_stop_sound(sfx_laser1)
		efeito_som(sfx_laser1, .1)
		
		if( level_tiro == 1)
		{
			tiro_1()
		}
		else if (level_tiro == 2)
		{
			tiro_2()		
		}
		else if(level_tiro == 3)
		{
			tiro_3()
		}
		
		//delay do tiro
		timer_tiro = espera_tiro	
	}
}


//tiro 1
tiro_1= function()
{
	//Criando o tiro
	//criando o tiro na camada dele

	var _tiro = instance_create_layer(x, y , "player_tiro", obj_tiro);
		
	//dando a velocidade para o tiro
	_tiro.vspeed = vel_tiro
		
	//avisando que o timer do tiro foi resetado
}
//tiro 2
tiro_2 = function()
{	
	//Criando o tiro
	var _tiro = instance_create_layer(x + 10 , y , "player_tiro", obj_tiro);
	_tiro.vspeed = vel_tiro
	
	_tiro = instance_create_layer(x - 10 , y , "player_tiro", obj_tiro);
	_tiro.vspeed = vel_tiro
}
//tiro3
tiro_3 = function()
{	
	tiro_1()
	tiro_2()
}

//ganhando level do tiro
ganha_level_tiro = function()
{
	if(level_tiro < 3)
	{
	level_tiro++
	}
}

//ganhando level do tiro
ganha_vida = function()
{
	vidas++
}

ganha_escudo = function()
{
	escudos++
}

ganha_velocidade = function()
{
	vel ++
}

ganha_velocidade_tiro = function()
{
	vel_tiro --
}

desenha_icone = function(_icone = spr_icone_vida, _qtd = 1, _y = 20)
{
	//draw_text(10, _gui_height - 40, "vida"))
	//usando o laço de repitiçao repeat

	var _espaco = 15

	repeat(_qtd)
	{
		draw_sprite_ext(_icone, 0, _espaco, _y - 20, 1, 1, 0, c_white, 0.6)
	
		_espaco += 25
	}
}

//metodo para perder vida
perde_vida = function()
{
	//so posso perder vida, se eu nao estou invencivel
	if(timer_invencivel > 0) return
	
	efeito_mola(2, 0.6)
	timer_efeito_branco(5)

	//perdendo vida se eu ainda tenho vida
	if(vidas > 1)
	{
		vidas --
		timer_invencivel = tempo_invencivel
		//levei dano, ele treme
		screenshake(20)
		
	}
	else //se eu nao tiver vida eu morro
	{
		screenshake(50)
		instance_create_layer(x, y, "particulas", obj_explosao_player)
		efeito_som(sfx_explosion, 0)
		instance_destroy()
		efeito_som(sfx_lose, 0)
		
		layer_sequence_create("sq_transicao", x, y, sq_transicao1)
		global.transicao = true
	}
}

//metodo para perder vida
usa_escudo = function()
{
	//crio escudos se eu tenhos escudos
	//e se eu ainda nao tenho escudo na vairavel meu escudo
	if(escudos > 0 && meu_escudo == noone)
	{
		escudos--
		
		//ativando o escudo
		efeito_som(sfx_shieldUp, 0)
	
		//quando a animaçao do escudo terminar
		//ele para a animaçao dele (image_speed = 0)
	
		//quando eu aperta a letra e, ele vai criar um escudo na minha posicao
		meu_escudo = instance_create_layer(x, y, "escudo" , obj_escudo)
	}
}

com_escudo = function()
{
	if(instance_exists(meu_escudo))
	{
		meu_escudo.x = x
		meu_escudo.y = y
	
		timer_invencivel = 10
	}else //nao tem um instancia no meu escudo
	{
		
		//eu aviso q o escudo dele é igual a none
		meu_escudo = noone
	}
}

#endregion



