/// @description Detener jugador contra un objeto solido

//Mueve al jugador hasta el ultimo pixel que choque con el solido
//move_contact_solid(direction, vspeed);

//Se detiene la velocidad vertical del jugador
//vspeed = 0;

//Verifica si existe algo en direcciones verticales
if(place_meeting(x,y+vspeed,oWall))
{
	while(!place_meeting(x,y+sign(vspeed),oWall))
	{
		y = y + sign(vspeed);
	}
	gravity = 0;
}



