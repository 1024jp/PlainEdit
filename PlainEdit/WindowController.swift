//
//  WindowController.swift
//  PlainEdit
//
//  Created by 1024jp on 2016/10/06.
//  © 2016-2017 1024jp
//

import Cocoa

final class WindowController: NSWindowController {
    
    override func windowDidLoad() {
        
        super.windowDidLoad()
        
        self.shouldCascadeWindows = true
        self.windowFrameAutosaveName = NSWindow.FrameAutosaveName(rawValue: "document")
        
        // -> needs layer to mask rounded window corners
        self.contentViewController?.view.wantsLayer = true
    }
    
}
