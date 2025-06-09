//debug do level do tiro
if (global.debug)
{
	draw_text(20, 20, "Level tiro: " + string(level_tiro))	
}

if(global.transicao) exit
var _gui_height = display_get_gui_height()
//desenhando as vidas do player
//desenhe a palavra vida na base da janela
//ele vai pedir o icone, ele vai pedir a quantidade de vezes para desenha
//desenhando escudos
desenha_icone(spr_icone_escudo, escudos, _gui_height - 10);

//desenhando as vidas
desenha_icone(spr_icone_vida, vidas, _gui_height - 40)
