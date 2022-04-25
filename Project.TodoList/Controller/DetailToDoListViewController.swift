//
//  DetailToDoListViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit

class DetailToDoListViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var entryTextViewTaskTitle: UITextView!
    @IBOutlet weak var entryTextViewTaskDetail: UITextView!
    
    @IBOutlet weak var imgIconDelete: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var viewBtnNewTask: UIView!
    @IBOutlet weak var txBtnNewTask: UILabel!
    @IBOutlet weak var imgBtnNewTask: UIImageView!
    @IBOutlet weak var btnNewTask: UIButton!
    
    @IBOutlet weak var bottomTextViewTaskDetail: NSLayoutConstraint!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        prepareView()
        
        entryTextViewTaskTitle.text = entry?.textTitle
        entryTextViewTaskDetail.text = entry?.textDetail
        
        entryTextViewTaskTitle.delegate = self
        entryTextViewTaskDetail.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeightd = keyboardRectangle.height
            
            bottomTextViewTaskDetail.constant = keyboardHeightd
        }
    }

    func prepareView() {
        
        if let imgButton = UIImage(named: "ic_trash") {
            imgIconDelete.image = imgButton
        }
        
        viewBtnNewTask.backgroundColor = .orange
        viewBtnNewTask.layer.cornerRadius = 15
    
        txBtnNewTask.text = "New Task"
        
        if let imageBtnNewTask = UIImage(named: "ic_angle_up") {
            imgBtnNewTask.image = imageBtnNewTask
        }
    }
    
    @IBAction func btnNewTask(_ sender: Any) {
        
        if entry == nil {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                entry = Entry(context: context)
                entry?.textTitle = entryTextViewTaskTitle.text
                entry?.textDetail = entryTextViewTaskDetail.text
                
                entryTextViewTaskTitle.becomeFirstResponder()
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDeleteToDoList(_ sender: Any) {
        
        if entry != nil {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                context.delete(entry!)
                try? context.save()
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        entry?.textTitle = entryTextViewTaskTitle.text
        entry?.textDetail = entryTextViewTaskDetail.text
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
}
