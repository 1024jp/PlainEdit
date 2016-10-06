//
//  WindowController.swift
//  PlainEdit
//
//  Created by 1024jp on 2016/10/06.
//  © 2016 1024jp
//

import Cocoa

class WindowController: NSWindowController {
    
    override func windowDidLoad() {
        
        super.windowDidLoad()
        
        self.shouldCascadeWindows = true
        self.windowFrameAutosaveName = "document"
    }
    
}
