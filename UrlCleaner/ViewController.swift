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
    
    @IBAction func checkBoxDidClick(_ sender: NSButtonCell) {
        let chkbox = sender as NSButtonCell
        checkStatevalues(chkbox.tag)
        debugPrint(chkbox.tag)
        debugPrint(UrlAddress.specialChars)
        
    }
    private func checkStatevalues(_ tag:Int){
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

