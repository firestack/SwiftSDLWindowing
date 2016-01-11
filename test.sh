swift build -c release && ( .build/release/SwiftGame || (swift build && lldb .build/debug/SwiftGame) )
