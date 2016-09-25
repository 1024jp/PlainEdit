//
//  Document.swift
//  PlainTextEditor
//
//  Created by 1024jp on 2016/09/26.
//  © 2016 1024jp
//

import Cocoa

class Document: NSDocument {
    
    let textStorage = NSTextStorage()
    private var encoding: String.Encoding = .utf8
    
    
    
    // MARK: -

    override init() {
        
        super.init()
        
        self.hasUndoManager = true
    }
    

    override class func autosavesInPlace() -> Bool {
        
        return true
    }
    
    
    override func makeWindowControllers() {
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        
        self.addWindowController(windowController)
    }

    
    override func data(ofType typeName: String) throws -> Data {
        
        let string = self.textStorage.string
        let encoding = self.encoding
        
        self.unblockUserInteraction()
        
        guard let data = string.data(using: encoding, allowLossyConversion: true) else {
            throw NSError(domain: CocoaError.errorDomain,
                          code: CocoaError.fileWriteInapplicableStringEncoding.rawValue,
                          userInfo: [NSStringEncodingErrorKey: encoding.rawValue])
        }
        
        return data
    }

    
    override func read(from data: Data, ofType typeName: String) throws {
        
        // decode data to string
        var convertedString: NSString?
        var usedLossy: ObjCBool = false
        self.encoding = String.Encoding(rawValue: NSString.stringEncoding(for: data,
                                                                          encodingOptions: [StringEncodingDetectionOptionsKey.suggestedEncodingsKey: [String.Encoding.utf8.rawValue]],
                                                                          convertedString: &convertedString,
                                                                          usedLossyConversion: &usedLossy))
        
        guard let string = convertedString as? String else {
            throw NSError(domain: CocoaError.errorDomain,
                          code: CocoaError.fileWriteInapplicableStringEncoding.rawValue,
                          userInfo: [NSStringEncodingErrorKey: self.encoding])
        }
        
        let range = NSRange(location: 0, length: self.textStorage.length)
        self.textStorage.replaceCharacters(in: range, with: string)
    }


}

