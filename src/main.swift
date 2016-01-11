import Foundation
import Glibc
import CSDL

class OBJ{

}


protocol Renderable{
	func render()

}

public class Rect{
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
	public func tick(screen:SDL_Rect){
		translate(velocity.x, velocity.y)
		if rect.x > screen.w || rect.x < 0{
			velocity.x = -velocity.x
		}

		if rect.y > screen.h || rect.y < 0{
			velocity.y = -velocity.y
		}
	}

	public func render(inout renderer:SDL_Surface){
		SDL_FillRect( &renderer, &rect, SDL_MapRGB(renderer.format, 255, 0, 0))
	}

	public func translate(x:Int32 = 0,_ y:Int32 = 0){
		rect.x += x
		rect.y += y
	}
}

var SDLV:SDL_version = SDL_version()

SDL_GetVersion(&SDLV)

print("Hello world! \nSDL VERSION \(SDLV.major, SDLV.minor, SDLV.patch)")

SDL_Init(UInt32(SDL_INIT_VIDEO))

var GWindow = SDL_CreateWindow("SDL_T", 0, 0, 640, 480, SDL_WINDOW_SHOWN.rawValue)
var GScreenSurface = SDL_GetWindowSurface( GWindow)
var renderer = SDL_CreateRenderer(GWindow, -1, 0)

print(GScreenSurface.memory, renderer)

var running = true
var MR = Rect(0,0,32,32)

while(running){
	var SDLEvent:SDL_Event = SDL_Event()
	SDL_PollEvent(&SDLEvent)

	switch (SDLEvent.type){
		case SDL_QUIT.rawValue:
			running = false



		default:
			MR.tick(GScreenSurface.memory.clip_rect)
			MR.render(&GScreenSurface.memory)
			SDL_UpdateWindowSurface(GWindow)
			SDL_FillRect(GScreenSurface, nil, 0)
			SDL_Delay(1000/30)
	}


}

SDL_FreeSurface(GScreenSurface)
SDL_DestroyWindow(GWindow)
