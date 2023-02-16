//
//  TextViewController.swift
//  PlainEdit
//
//  Created by 1024jp on 2016/09/26.
//  © 2016-2023 1024jp
//

import Cocoa

final class TextViewController: NSViewController {
    
    @IBOutlet private var textView: NSTextView!
    
    private var document: Document? {
        self.view.window?.windowController?.document as? Document
    }
    
    
    // MARK: -
    
    override func viewWillAppear() {
        
        super.viewWillAppear()
        
        self.textView.textContentStorage?.textStorage = self.document!.textStorage
    }
}
