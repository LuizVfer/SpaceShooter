
//criando a minha primeira onda
layer_sequence_create("seq_inimigos", 0, 0, ondas[atual])

//reinicio o alarme em 300 frames e aumento o valor do indice

if(atual < array_length(ondas) - 1)
{
	atual++
	
	alarm[0] = 520
}