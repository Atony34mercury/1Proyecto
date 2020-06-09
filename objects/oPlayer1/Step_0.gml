key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_space = keyboard_check_pressed(vk_space);

//Si tecla Derecha se presiona move es 1
//Si tecla Izquierda se presiona mobe es -1
move = key_right - key_left;
movimientoX = 0;
#region //Movimiento Horizontal

//Movimiento a la derecha
if move>=1 && place_free(x + velocidad, y){
	movimientoX =  velocidad;
	//Rotacion del personaje
	image_angle = image_angle - 4;
}
	
//Movimiento a la izquierda
if move<=-1 && place_free(x - velocidad, y){
	movimientoX = -velocidad;
	//Rotacion del personaje
	image_angle = image_angle + 4;
}
#endregion

#region //Movimiento vertical
// Saltar
if key_space && !place_free(x, y +1){
	vspeed = -salto;
}

//Si existe un objeto solido por debajo del player, entonces cambia la gravedad
if place_free(x, y + 1){
	gravity = .5;
}
#endregion

x = x + movimientoX;
