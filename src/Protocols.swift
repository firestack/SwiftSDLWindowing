
protocol Buildable{
	static var canBuild:Bool { get }
}

protocol Tickable{
	func tick(dt:Float)
}

protocol Hashable{
	var Hash:Int { get }
}

protocol Renderable {
	func render()
}
