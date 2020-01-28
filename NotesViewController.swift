//
//  NotesViewController.swift
//  Notey 2.3
//
//  Created by UMANG BARTHWAL on 27/01/20.
//  Copyright © 2020 UMANG BARTHWAL. All rights reserved.
//

import UIKit

protocol NoteViewDelegate {
      func didUpdateNoteWithTitle(newTitle: String, andBody newBody: String)
      }

class NotesViewController: UIViewController, UITextViewDelegate {
    
    var strBodyText : String!
    var delegate : NoteViewDelegate?
    
    @IBOutlet weak var btnDoneEditing: UIBarButtonItem!
    
    @IBAction func doneEditingBody()
    {
        self.txtBody.resignFirstResponder()
        self.btnDoneEditing.tintColor = UIColor.clear
        
        if self.delegate  != nil{
            self.delegate!.didUpdateNoteWithTitle(newTitle: self.navigationItem.title!, andBody: self.txtBody.text)
        }
    }
    
    

    @IBOutlet weak var txtBody : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtBody.text = self.strBodyText
         self.txtBody.becomeFirstResponder()
 
        self.txtBody.delegate=self
        

        // Do any additional setup after loading the view.
    }
    
    
    func textViewDidBeginEditing(textView: UITextView)
    {
        self.btnDoneEditing.tintColor=UIColor(red: 0, green: 122.0/255.0, blue: 1, alpha: 1)
    }
    
  
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


