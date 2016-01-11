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
	}
//==============================================================================
	static func checkTime(){
		LastTime = CurrentTime
		CurrentTime = SDL_GetTicks()
		DT = Float(( LastTime - CurrentTime / 100 )) / 10.0
		
	}



	static func gameLoop(){
		tickLoop()
		renderLoop()
	}
}
