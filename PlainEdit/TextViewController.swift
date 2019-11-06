//
//  TextViewController.swift
//  PlainEdit
//
//  Created by 1024jp on 2016/09/26.
//  © 2016-2019 1024jp
//

import Cocoa

final class TextViewController: NSViewController {
    
    @IBOutlet private var textView: NSTextView!
    @IBOutlet private var textFinder: NSTextFinder!
    
    private var document: Document? {
        return self.view.window?.windowController?.document as? Document
    }
    
    
    
    // MARK: -
    
    override func viewWillAppear() {
        
        super.viewWillAppear()
        
        self.textView.layoutManager?.replaceTextStorage(self.document!.textStorage)
    }
    
}
