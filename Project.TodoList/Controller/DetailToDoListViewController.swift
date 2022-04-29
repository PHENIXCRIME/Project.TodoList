//
//  DetailToDoListViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit
import Firebase
import FirebaseDatabase
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming
import Material

class DetailToDoListViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tfTaskTitle: MDCFilledTextField!
    @IBOutlet weak var tfTaskDetail: MDCFilledTextField!
    
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
        
        backToDoListViewController()
    }
    
    @IBAction func btnNewTask(_ sender: Any) {
        
        checkDataToDoList(txTitle: tfTaskTitle.text, txDetail: tfTaskDetail.text)
        backToDoListViewController()
    }
    
    @IBAction func btnDeleteToDoList(_ sender: Any) {
        
        backToDoListViewController()
    }
    
    func checkDataToDoList(txTitle: String?, txDetail: String?) {
        
        if (txTitle?.count ?? 0) == 0 && (txDetail?.count ?? 0) == 0 {
    
            showWrongBoth(controller: self)
        } else if (txTitle?.count ?? 0) == 0 {
            
            showTitleToDoRequired(controller: self)
        } else if (txDetail?.count ?? 0) == 0 {
            
            showDetailToDoRequired(controller: self)
        } else if let title = txTitle, let detail = txDetail{
            
            addDataToDoList(toDoTitle: title, toDoDetail: detail)
        }
    }

    func addDataToDoList(toDoTitle: String, toDoDetail: String) {
        
        let key = refToDoList.childByAutoId().key
        
        let toDoLists = ["id": key,
                         "titleToDoList": toDoTitle,
                         "detailToDoList": toDoDetail
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
    
    func backToDoListViewController() {
        
        self.dismiss(animated: true)
    }
    
    func showTitleToDoRequired(controller: UIViewController) {
        
        let alert = UIAlertController(title: "Sorry!", message: "TitleToDo is required.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        }))
        controller.present(alert, animated: true, completion: nil)
    }
    
    func showDetailToDoRequired(controller: UIViewController) {
        
        let alert = UIAlertController(title: "Sorry!", message: "DetailToDo is required.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        }))
        controller.present(alert, animated: true, completion: nil)
    }
    
    func showWrongBoth(controller: UIViewController) {
        
        let alert = UIAlertController(title: "Sorry!", message: "TitleToDo and DetailToDo is required.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        }))
        controller.present(alert, animated: true, completion: nil)
    }
    
}
