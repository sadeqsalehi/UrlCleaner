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
    override func viewDidLoad() {
        super.viewDidLoad()
     txtUrl.stringValue = Url.cleanUpUrl("http://www.soft98.ir/the-movie_name+size.extension-.mkv")
      
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

