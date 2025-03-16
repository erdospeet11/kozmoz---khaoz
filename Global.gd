extends Node

enum GravityState {UP, DOWN, LEFT, RIGHT, FORWARD, BACKWARD, NONE}
var gravityzonecolors = {
	GravityState.UP    : Color(255,0,0),
	GravityState.DOWN  : Color(255,255,0), 
	GravityState.LEFT  : Color(0,255,0),
	GravityState.RIGHT : Color(0,255,255),
	GravityState.NONE  : Color(0,0,0)
}
