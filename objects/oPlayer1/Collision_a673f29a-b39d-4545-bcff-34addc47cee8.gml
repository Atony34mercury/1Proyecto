/// @description //Cuestas

//Personaje capaz de subir cuestas
if(place_meeting(x + move,y,oWall) && !place_meeting(x + move,y - 2,oWall)){
	y--;
}

//Bajar cuestas
if(place_meeting(x + sign(salto),y,oWall) && !place_meeting(x + sign(salto),y + 1,oClimb)
	&& place_meeting(x+sign(salto),y + 2, oWall)){
	y++;
}



