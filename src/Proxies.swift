import Foundation
import CSDL

public class ControlProxy {

	static var LastTime:UInt32 = 0
	static var CurrentTime:UInt32 = 0

	static var DT:Float = 0

//==============================================================================

	private static func renderLoop(){
		renderPre()
		renderMain()
		renderPost()
		renderFinish()
	}

	private static func renderPre(){
		SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
		SDL_RenderClear(Engine.renderers[0])
		SDL_SetRenderDrawColor(renderer, 255, 0xF0, 0, 255);
	}

	private static func renderMain(){
		for i in UObject.Objects{
			if let obj = i as? Renderable{
				obj.render()
			}
		}
	}

	private static func renderPost(){
	}

	private static func renderFinish(){
		SDL_RenderPresent(Engine.renderers[0]);
	}

//==============================================================================
	private static func tickLoop(){
		tickPre()
		tickMain()
		tickPost()
		tickFinish()
	}

	private static func tickPre(){
		checkTime()
	}

	private static func tickMain(){
		for i in UObject.Objects{
			if let obj = i as? Tickable{
				obj.tick(DT)
			}
		}
	}

	private static func tickPost(){
	}

	private static func tickFinish(){
		SDL_Delay(16)
	}
//==============================================================================
	static func checkTime(){
		LastTime = CurrentTime
		CurrentTime = SDL_GetTicks()
		DT = Float(( LastTime - CurrentTime / 100 )) / 10.0

	}



	static func gameLoop(){

		tickLoop()
	}

	static func startRenderThread() {
		NSThread.detachNewThread({while(Engine.Running){renderLoop()}})

	}
}
