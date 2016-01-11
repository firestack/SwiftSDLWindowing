
import CSDL

public class Rect:UObject, Tickable, Renderable{
	var rect = SDL_Rect()
	var velocity = SDL_Rect()

	init(_ x:Int32, _ y:Int32, _ w:Int32, _ h:Int32){
		rect.x = x
		rect.y = y
		rect.w = w
		rect.h = h
		velocity.x = 1
		velocity.y = 2
	}
	public func tick(dt:Float){
		translate(velocity.x, velocity.y)

		if ((rect.x+rect.w) > 0 || rect.x < 0){
			velocity.x = -velocity.x
		}

		if ((rect.y+rect.h) > 0 || rect.y < 0){
			velocity.y = -velocity.y
		}
	}

	public func render(){
		//SDL_FillRect( SDL_GetWindowSurface( Engine.windows[0]), &rect, SDL_MapRGB(SDL_GetWindowSurface( Engine.windows[0]).format, 255, 0, 0))
	}

	public func translate(x:Int32 = 0,_ y:Int32 = 0){
		rect.x += x
		rect.y += y
	}

	public func SetLocation(x:Int32 = 0, _ y:Int32 = 0){
		rect.x = x - (rect.w/2)
		rect.y = y - (rect.h/2)
	}

	public func SetVelocity(x:Int32 = 0, _ y:Int32 = 0, dampening:Int32 = 1){
		velocity.x = x / dampening
		velocity.y = y / dampening
	}
}