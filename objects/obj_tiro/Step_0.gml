//cheando se eu sai da room por cima


if (y <= -32)
{
	//Me destruindo
	instance_destroy()
}

//fazendo o tiro ficar menor
image_xscale = lerp(image_xscale, 1, 0.08)
image_yscale = lerp(image_yscale, 1, 0.08)

