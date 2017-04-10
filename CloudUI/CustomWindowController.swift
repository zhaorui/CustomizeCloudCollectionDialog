//
//  CustomWindowController.swift
//  CloudUI
//
//  Created by 赵睿 on 07/04/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class MyTextField: NSTextField {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.focusRingType = .default
    }
    
    override func textDidChange(_ notification: Notification) {
        super.textDidChange(notification)
        Swift.print(self.stringValue)
    }
    
    override func takeStringValueFrom(_ sender: Any?) {
        Swift.print("sender \(sender)")
        Swift.print(self.stringValue)
    }
}


let placeholderString = NSAttributedString(string: "Place Holder Value",
                                           attributes: [NSForegroundColorAttributeName : NSColor.gray])
class MyTextView: NSTextView {
//    override func didChangeText() {
//        Swift.print("didChangeText")
//        super.didChangeText()
//    }
    
    //TODO: why can't define in here??
//    let placeholderString = NSAttributedString(string: "Place Holder Value",attributes: [NSForegroundColorAttributeName : NSColor.gray])
    
//    let placeholder = NSAttributedString(string: "place holder")
    let placeholder = NSAttributedString(string: "place holder value",
                                        attributes: [NSForegroundColorAttributeName: NSColor.gray])
    
    
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    

    
    override func becomeFirstResponder() -> Bool {
        Swift.print("MyTextView become first responder")
        self.setSelectedRange(NSMakeRange(0, 0))
        self.superview?.superview?.focusRingType = .exterior
        return true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        if self.string == "" {
            placeholder.draw(at: NSMakePoint(5, 0))
            //placeholderString.draw(at: NSMakePoint(0, 0))
        }
    }
}

@IBDesignable class CustomizeWindowContentView: NSView {
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.white.set()
        NSBezierPath(rect: dirtyRect).fill()
    }
}

class CustomWindowController: NSWindowController {

    @IBOutlet weak var buttonNameField: NSTextField!
    @IBOutlet var keywordsTextView: NSTextView!
    @IBOutlet weak var saveButton: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        self.window?.titlebarAppearsTransparent = true
        self.window?.titleVisibility = .hidden
    }
    
    @IBAction func closeWindow(_ sender: NSButton) {
        self.close()
    }
    
    
    @IBAction func createButton(_ sender: NSButton) {
        let btn_name = self.buttonNameField.stringValue
        let keywords = self.keywordsTextView.textStorage?.string.components(separatedBy: "\n").filter({ !$0.isEmpty })
        
        Swift.print("btn_name: \(btn_name)")
        Swift.print("keywords: \(keywords)")
    }
    
    //MARK: text operation
    override func controlTextDidBeginEditing(_ obj: Notification) {
        
    }
    
    override func controlTextDidChange(_ obj: Notification) {
        if buttonNameField.stringValue.characters.count > 8 {
            var str = buttonNameField.stringValue
            str = str.substring(to: str.index(str.startIndex, offsetBy: 8))
            buttonNameField.stringValue = String(str)
        }
    }
    
    override func controlTextDidEndEditing(_ obj: Notification) {
        
    }
    
}

extension CustomWindowController : NSTextViewDelegate {
    func textShouldBeginEditing(_ textObject: NSText) -> Bool {
        
        return true
    }
    
    func textDidBeginEditing(_ notification: Notification) {
        
    }
    
    func textDidChange(_ notification: Notification) {
        
    }
    
    
}
