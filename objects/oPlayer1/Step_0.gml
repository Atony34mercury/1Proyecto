key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(vk_down);
key_jump = keyboard_check_pressed(vk_space);


//Si se presiona la flecha derecha el resultado es 1 y si no es -1
var move = key_right - key_left;
hsp = move * walksp;

//Rotacion del personaje
show_debug_message(image_angle);

image_angle = image_angle - move*4;

//image_angle = lerp(image_angle, move*15,0.3);

#region //Movimiento vertical, saltar o subir escaleras
//Verifica si esta chocando con la escalera y cambia la velocidad
//Arriba es negativo abajo positivo
var moveV = key_down - key_up;

if(place_meeting(x,y,oLadder)){
	vsp = vsp + moveV * laddersp;
}

// Saltar
if(place_meeting(x,y+1,oWall) && key_jump){
	vsp = vsp - jump;
}
#endregion

#region //Cuestas
//Personaje capaz de subir cuestas
if(place_meeting(x + move,y,oWall) && !place_meeting(x + move,y - 2,oWall)){
	y--;
}

//Bajar cuestas
if(place_meeting(x + sign(hsp),y,oWall) && !place_meeting(x + sign(hsp),y + 1,oClimb)
	&& place_meeting(x+sign(hsp),y + 2, oWall)){
	y++;
}
#endregion

//Aplica la gravedad
vsp = vsp + grv;


#region //Verifica las colisiones para detener 


//Verifica si existe algo en direcciones horizontales
if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;	
}

//Verifica si existe algo en direcciones verticales
if(place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0
}
#endregion


//Movimiento del personaje
x = x + hsp;
y = y + vsp;
