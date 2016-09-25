//
//  TextViewController.swift
//  PlainTextEditor
//
//  Created by 1024jp on 2016/09/26.
//  © 2016 1024jp
//

import Cocoa

class TextViewController: NSViewController {
    
    @IBOutlet var textView: NSTextView?
    
    var document: Document? {
        return self.view.window?.windowController?.document as? Document
    }
    
    
    
    // MARK: -
    
    override func viewWillAppear() {
        
        super.viewWillAppear()
        
        guard let document = self.document else {
            assertionFailure("no document found.")
            return
        }
        
        self.textView?.layoutManager?.replaceTextStorage(document.textStorage)
    }


}

