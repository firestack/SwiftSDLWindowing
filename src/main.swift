import Foundation
import Glibc
import CSDL




Engine.start()
print(Engine.VERSION)

Engine.createWindow(winSizeX:600, winSizeY:400)

var GWindow = Engine.windows[0]
var renderer = Engine.renderers[0]

func makeRect(){
	var a = Rect( Int32(random()) % 600, Int32(random()) % 400, 20, 20)
	a.SetVelocity(Int32(random()) % 20, Int32(random()) % 20)
}

var EventHandler = {
	var event = SDL_Event()

	while(Engine.Running){
		while(SDL_PollEvent(&event) != 0){
			switch(event.type){
				case SDL_QUIT.rawValue:
					Engine.Running = false

				case SDL_MOUSEBUTTONDOWN.rawValue:
					for i in 0..<5{makeRect()}

				case SDL_MOUSEBUTTONUP.rawValue:
					break;

				default:
					break
			}
		}
	}
}

var Mainloop = {
	while(Engine.Running){
		ControlProxy.gameLoop()
	}
}

for i in 0..<1{
	makeRect()
}

NSThread.detachNewThread({EventHandler()})
ControlProxy.startRenderThread()
Mainloop()

Engine.stop()

//surfaces are out dated. lets use the renderer.
//var GScreenSurface = SDL_GetWindowSurface( GWindow)



// while(running){
// 	while(SDL_PollEvent(&SDLEvent) != 0){
// 		switch (SDLEvent.type){
// 			case SDL_QUIT.rawValue:
// 				running = false
//
// 			case SDL_MOUSEBUTTONDOWN.rawValue:
// 				MR.SetLocation(SDLEvent.button.x, SDLEvent.button.y)
// 				MR.SetVelocity(0,0)
// 				FLoc =  SDLEvent
//
// 			case SDL_MOUSEBUTTONUP.rawValue:
// 				LLoc = SDLEvent
//
// 				MR.SetVelocity(LLoc.button.x - FLoc.button.x, LLoc.button.y - FLoc.button.y, dampening:10 )
//
//
// 			default:
// 				break
//
// 		}
// 	}
//
// 	// MR.tick(GScreenSurface.memory.clip_rect)
// 	// MR.render(&GScreenSurface.memory)
// 	// SDL_UpdateWindowSurface(GWindow)
// 	// SDL_FillRect(GScreenSurface, nil, 0)
// 	// SDL_Delay(1000/120)
// }
