//
//  Utilities.swift
//  PlainEdit
//
//  Created by 1024jp on 2016/09/26.
//  © 2016 1024jp
//

import Foundation


/// debug friendly print with a dog/cow.
func moof(_ items: Any..., function: String = #function) {
    
    let icon = Thread.isMainThread ? "🐕" : "🐄"
    
    Swift.print(icon + " \(function) ", terminator: "")
    if items.isEmpty {
        Swift.print("")
    } else {
        Swift.debugPrint(items)
    }
}
