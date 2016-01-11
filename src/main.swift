import Foundation
import Glibc
import CSDL




Engine.start()
print(Engine.VERSION)

Engine.createWindow(winSizeX:600, winSizeY:400)

var GWindow = Engine.windows[0]
var renderer = Engine.renderers[0]

for i in 0..<10{
	var a = Rect(Int32(i*2),Int32(i*2),2,2)
}

var EventHandler = {
	var event = SDL_Event()

	while(Engine.Running){
		while(SDL_PollEvent(&event) != 0){
			switch(event.type){
				case SDL_QUIT.rawValue:
					Engine.Running = false

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

NSThread.detachNewThread({EventHandler()})
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
