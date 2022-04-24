//
//  DetailToDoListViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit

class DetailToDoListViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var entryTextViewTaskTitle: UITextView!
    @IBOutlet weak var entryTextViewTaskDetail: UITextView!
    
    @IBOutlet weak var imgIconDelete: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
        
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        
        if entry == nil {
            // create
            
        } else {
            // fill in info about exitsing entry
            entryTextViewTaskTitle.text = entry!.textTitle
            entryTextViewTaskDetail.text = entry!.textDetail
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if entry == nil {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                let entry = Entry(context: context)
                entry.date = datePicker.date
                entry.textTitle = entryTextViewTaskTitle.text
                entry.textDetail = entryTextViewTaskDetail.text
                
            }
        }
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()

    }

    func prepareView() {
        
        if let imgButton = UIImage(named: "ic_trash") {
            imgIconDelete.image = imgButton
        }
    }
    
    @IBAction func btnDeleteToDoList(_ sender: Any) {
        
        print("Delete ToDoList")
        
        if entry != nil {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                context.delete(entry!)
                try? context.save()
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
}
