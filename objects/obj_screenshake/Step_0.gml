//tremendo a tela
// alterando a posiçao x e y do viewport com base no valor do treme

show_debug_message(treme)
if(treme > 0.1)
{	
	var _x = random_range(-treme, treme)
	var _y = random_range(-treme , treme)
	//alterando a posiçao x do viewport
	view_set_xport(view_current, _x)
	view_set_yport(view_current, _y)
}
else //cheguei perto de 0 eu zero o valor treme
{
	treme = 0
	
	//garando que a posiçao da minha view é zerada tbm
	view_set_xport(view_current, 0)
	view_set_yport(view_current, 0)
}

//parando de tremer de pouquinho em pouquinho
treme = lerp(treme, 0, .1)