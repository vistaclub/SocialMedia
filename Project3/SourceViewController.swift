//
//  SourceViewController.swift
//  Project1
//
//  Created by Jason Wong on 2018-08-18.
//  Copyright © 2018 Jason Wong. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    @IBOutlet var tableView: NSTableView!
    var pictures = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // get a list of all the files in our bundle's resource path.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // loop over each file we found
        for item in items {
            
            // if this item starts with "nssl" add it to our array
            if item.hasPrefix("nssl") {
                
                pictures.append(item)
            }
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView
            else {
                return nil
        }
        vw.textField?.stringValue = pictures[row]
        
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        if let detail = splitVC.childViewControllers[1] as? DetailViewController {
            
            detail.imageSelected(name: pictures[tableView.selectedRow])
        }
    }
}
