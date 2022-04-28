//
//  DetailToDoListViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit
import Firebase
import FirebaseDatabase

class DetailToDoListViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tfTaskTitle: UITextField!
    @IBOutlet weak var tfTaskDetail: UITextField!
    
    @IBOutlet weak var viewBtnClose: UIView!
    @IBOutlet weak var imgBtnClose: UIImageView!
    @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var imgIconDelete: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var viewBtnNewTask: UIView!
    @IBOutlet weak var txBtnNewTask: UILabel!
    @IBOutlet weak var imgBtnNewTask: UIImageView!
    @IBOutlet weak var btnNewTask: UIButton!
    
    @IBOutlet weak var bottomTfTaskDetail: NSLayoutConstraint!
    
    var refToDoList: DatabaseReference!
    
    var toDoLists = [ToDoListModel]()
    var toDoListAll = [ToDoListModel]()
    
    static let identifier = "DetailToDoListViewController"
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        refToDoList = Database.database().reference().child("toDoLists");
        prepareView()
        
    }
    
    func prepareView() {
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        viewBtnClose.backgroundColor = .clear
        
        if let imageBtnClose = UIImage(named: "ic_close") {
            imgBtnClose.image = imageBtnClose
        }
        
        if let imageBtnDelete = UIImage(named: "ic_trash") {
            imgIconDelete.image = imageBtnDelete
        }
        
        viewBtnNewTask.backgroundColor = AppColor.grayF7
        viewBtnNewTask.layer.cornerRadius = 20
        
        txBtnNewTask.text = "New Task"
        
        if let imageBtnNewTask = UIImage(named: "ic_angle_up") {
            imgBtnNewTask.image = imageBtnNewTask
        }
        
        tfTaskTitle.placeholder = "Enter task title"
        tfTaskDetail.placeholder = "Enter task detail"
        
        let newPosition = tfTaskDetail.beginningOfDocument
        tfTaskDetail.selectedTextRange = tfTaskDetail.textRange(from: newPosition, to: newPosition)
    }
    
    @IBAction func btnCloseTask(_ sender: Any) {
        
        presentViewController()
    }
    
    @IBAction func btnNewTask(_ sender: Any) {
        
        addToDoList()
        presentViewController()
    }
    
    @IBAction func btnDeleteToDoList(_ sender: Any) {
        
        presentViewController()
    }
    
    func addToDoList() {
        let key = refToDoList.childByAutoId().key
        
        let toDoLists = ["id": key,
                         "titleToDoList": tfTaskTitle.text! as String,
                         "detailToDoList": tfTaskDetail.text! as String
        ]
        
        refToDoList.child(key ?? "1").setValue(toDoLists)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeightd = keyboardRectangle.height
            
            bottomTfTaskDetail.constant = keyboardHeightd
        }
    }
    
    func presentViewController() {
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: TodolistViewController.identifier) as! TodolistViewController
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
}
