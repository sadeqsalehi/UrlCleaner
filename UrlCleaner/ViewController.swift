//
//  ViewController.swift
//  UrlCleaner
//
//  Created by Ninan on 3/5/19.
//  Copyright © 2019 Ninan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var txtUrl: NSTextField!
    
    @IBOutlet weak var chkHypens: NSButtonCell!
    
    @IBOutlet weak var chkUnderScores: NSButton!
    
    @IBOutlet weak var chkDots: NSButtonCell!
    
    @IBAction func buttonDidClick(_ sender: NSButton) {
        let button = sender as NSButton
        debugPrint(button.title)
        checkWichBittonClicked(button.title)
        
    }
    @IBAction func checkBoxDidClick(_ sender: NSButtonCell) {
        let chkbox = sender as NSButtonCell
        checkStatevalues(chkbox.tag)
        debugPrint(chkbox.tag)
        debugPrint(UrlAddress.specialChars)
        
    }
    private func checkWichBittonClicked(_ title:String)->Void{
        switch title {
        case "Copy":
            pasteboardClearContents()
            setPasteboardItems(txtUrl.stringValue)
        case "Paste":
            txtUrl.stringValue = pasteboardStringContent()
        case "Clean Up":
          txtUrl.stringValue  =   UrlAddress.cleanUpUrl(txtUrl.stringValue, UrlAddress.specialChars)
            
        default:
            break
        }
    }
    private func setPasteboardItems(_ item: String)->Void{
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        pasteboard.setString(item, forType: NSPasteboard.PasteboardType.string)
        var clipboardItems: [String] = []
        for element in pasteboard.pasteboardItems! {
            if let str = element.string(forType: NSPasteboard.PasteboardType(rawValue: "public.utf8-plain-text")) {
                clipboardItems.append(str)
                if clipboardItems.count>0 {
                    debugPrint(clipboardItems)
                }
            }
        }
    }
    func pasteboardStringContent() -> String
    {
        if NSPasteboard.general.pasteboardItems!.count > 0 {
            return (NSPasteboard.general.pasteboardItems?.first?.string(forType: .string))!
        }
        else{
            return ""
        }
        // return NSPasteboard.general.pasteboardItems?.first?.string(forType: .string)
    }
    func pasteboardClearContents()->Void{
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        
    }
    private func checkStatevalues(_ tag:Int)->Void{
        switch tag {
        case 1:
            if chkHypens.state.rawValue == 1 {
                UrlAddress.addToSpecialChars("-")
            }else
            {
                UrlAddress.removeFromSpecialChars("-")
            }
        case 2:
            if chkUnderScores.state.rawValue == 1
            {
                UrlAddress.addToSpecialChars("_")
            }
            else
            {
                UrlAddress.removeFromSpecialChars("_")
            }
        case 3:
            if chkDots.state.rawValue == 1
            {
                UrlAddress.addToSpecialChars(".")
            }
            else{
                UrlAddress.removeFromSpecialChars(".")
            }
        default:
            break
        }
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUrl.stringValue = UrlAddress.cleanUpUrl("http://www.soft98.ir/the-movie_name+size.extension-.mkv")
        checkStatevalues(1)
        checkStatevalues(2)
        checkStatevalues(3)
        
        // setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

