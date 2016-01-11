import CSDL


public class Engine{
	static var windows = [COpaquePointer]()
	static var renderers = [COpaquePointer]()
	static var Running = false



	public static var SDL_VERSION:String {
		get {
			var SDLV:SDL_version = SDL_version()
			SDL_GetVersion(&SDLV)
			return "\(SDLV.major, SDLV.minor, SDLV.patch)"
		}
	}

	public static var VERSION:String {
		get {
			return "bE 1.0.0"
		}
	}

	public static func start(){

		Running = true
		SDL_Init(UInt32(SDL_INIT_VIDEO))
	}

	public static func stop(){
		for _ in 0..<windows.count{
			destroyWindow()
		}
	}

	public static func createWindow(winName:String="SDL Window", winSizeX:Int32=100, winSizeY:Int32=100, winX:Int32=0, winY:Int32=0){
		windows.append(SDL_CreateWindow(winName, winX, winY, winSizeX, winSizeY, SDL_WINDOW_SHOWN.rawValue))
		renderers.append(SDL_CreateRenderer(windows[windows.count-1], -1, 0))

	}

	public static func destroyWindow(winName:String? = nil, winNumber:Int = 0){
		SDL_DestroyWindow(Engine.windows.removeAtIndex(winNumber))
		SDL_DestroyRenderer(Engine.renderers.removeAtIndex(winNumber))

	}


}
