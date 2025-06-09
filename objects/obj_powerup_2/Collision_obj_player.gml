//colidi com o powerm eu me mato
instance_destroy()

//rodando o metodo de ganhar level do player
other.ganha_vida()

//criando a particula do tiro na minha posiçao
var _explosao = instance_create_depth(x, y, layer, obj_explosao_tiro)
//quero mudar o angulo dela

_explosao.image_angle = random(359)