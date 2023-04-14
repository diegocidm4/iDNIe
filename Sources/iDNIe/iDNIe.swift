import Foundation

public struct iDNIe {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func devuelveTexto() -> String
    {
        let bundleID = Bundle.main.bundleIdentifier
        return text + bundleID!
    }
}
