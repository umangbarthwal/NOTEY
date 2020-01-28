//
//  ViewController.swift
//  Notey 2.3
//
//  Created by UMANG BARTHWAL on 25/01/20.
//  Copyright © 2020 UMANG BARTHWAL. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, NoteViewDelegate {
    
    var selectedIndex = -1
    var arrNotes = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     }
    override func didReceiveMemoryWarning() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")!
        cell.textLabel!.text=arrNotes[indexPath.row]["title"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedIndex=indexPath.row
    performSegue(withIdentifier: "showEditorSegue", sender: nil)
        
    }
    
    @IBAction func newNote()
    {
        var newDict = ["title" : "Test Note", "body": "Good Day !!!"]
        arrNotes.insert(newDict, at: 0)
        
        self.selectedIndex = 0
        
        self.tableView.reloadData()
        
        performSegue(withIdentifier: "showEditorSegue", sender: nil)
        
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let notesEditorVC = segue.destination as! NotesViewController
        
        notesEditorVC.navigationItem.title=arrNotes[self.selectedIndex]["title"]
        notesEditorVC.strBodyText = arrNotes[self.selectedIndex]["body"]
        notesEditorVC.delegate=self
        
    }
    
    
    func didUpdateNoteWithTitle(newTitle: String, andBody newBody: String) {
        self.arrNotes[self.selectedIndex]["tiltle"] = newTitle
        self.arrNotes[self.selectedIndex]["body"] = newBody
        
       
    }
    

    
    
}




