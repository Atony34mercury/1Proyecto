key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;
hsp = move * walksp;

//Verifica si esta chocando con la escalera y cambia la velocidad
//Arriba es negativo abajo positivo
var moveV = key_down - key_up;

if(place_meeting(x,y,oLadder)){
	vsp = vsp + moveV * laddersp;
}else{
	//Aplica la gravedad
	vsp = vsp + grv;
}

// Saltar
if(place_meeting(x,y+1,oWall) && key_jump){
	vsp = vsp - jump;
}

//Personaje capaz de pasar por cuestas
if(place_meeting(x + move,y,oWall) && !place_meeting(x + move,y - 2,oWall)){
	y--;
}

//Bajar cuestas
if(place_meeting(x + sign(hsp),y,oWall) && !place_meeting(x + sign(hsp),y + 1,oClimb)
	&& place_meeting(x+sign(hsp),y + 2, oWall)){
	y++;
}

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
