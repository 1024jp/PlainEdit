//
//  Document.swift
//  PlainEdit
//
//  Created by 1024jp on 2016/09/26.
//  © 2016-2023 1024jp
//

import Cocoa

final class Document: NSDocument {
    
    let textStorage = NSTextStorage()
    private var encoding: String.Encoding = .utf8
    
    
    // MARK: -
    
    override class var autosavesInPlace: Bool {
        
        true
    }
    
    
    override class func canConcurrentlyReadDocuments(ofType: String) -> Bool {
        
        true
    }
    
    
    override func canAsynchronouslyWrite(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType) -> Bool {
        
        true
    }
    
    
    override func makeWindowControllers() {
        
        let storyboard = NSStoryboard.main!
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        
        self.addWindowController(windowController)
    }
    
    
    override func data(ofType typeName: String) throws -> Data {
        
        let string = self.textStorage.string
        let encoding = self.encoding
        
        self.unblockUserInteraction()
        
        guard let data = string.data(using: encoding) else {
            throw CocoaError(.fileWriteInapplicableStringEncoding,
                             userInfo: [NSStringEncodingErrorKey: encoding.rawValue])
        }
        
        return data
    }
    
    
    override func read(from url: URL, ofType typeName: String) throws {
        
        let string = try String(contentsOf: url, usedEncoding: &self.encoding)
        let range = NSRange(..<self.textStorage.length)
        
        self.textStorage.replaceCharacters(in: range, with: string)
    }
}
