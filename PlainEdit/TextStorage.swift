//
//  TextStorage.swift
//  PlainEdit
//
//  Created by 1024jp on 2020-04-30.
//  © 2020 1024jp
//

import Cocoa

final class TextStorage: NSTextStorage {
    
    // MARK: Private Properties
    
    private let storage = NSTextStorage()
    
    
    
    // MARK: Primitive Text Storage Methods
    // cf. https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/TextStorageLayer/Tasks/Subclassing.html
    
    override var string: String {
        
        return self.storage.string
    }
    
    
    override func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedString.Key: Any] {
        
        return self.storage.attributes(at: location, effectiveRange: range)
    }
    
    
    override func replaceCharacters(in range: NSRange, with str: String) {
        
        self.storage.replaceCharacters(in: range, with: str)
        self.edited(.editedCharacters, range: range, changeInLength: (str as NSString).length - range.length)
    }
    
    
    override func setAttributes(_ attrs: [NSAttributedString.Key: Any]?, range: NSRange) {
        
        self.storage.setAttributes(attrs, range: range)
        self.edited(.editedCharacters, range: range, changeInLength: 0)
    }
    
}
