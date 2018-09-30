//
//  DetailViewController.swift
//  Project1
//
//  Created by Jason Wong on 2018-08-18.
//  Copyright © 2018 Jason Wong. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    
    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String) {
        
        imageView.image = NSImage(named: NSImage.Name(rawValue: name))
    }
}
