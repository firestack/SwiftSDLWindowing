

public class UObject: Hashable{
	var pos:Int
	init(){
		pos = UObject.Objects.count
		UObject.Objects.append(self)
	}

	var Name:String {
		return "\(self.dynamicType)\(pos)"
	}

	public var Hash:Int {
		return Name.hashValue
	}

	public static var Objects = [UObject]()

	public class func create() -> UObject {
		Objects.append(UObject())
		return Objects[Objects.count-1]
	}

}
