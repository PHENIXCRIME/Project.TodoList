//
//  DetailToDoListViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit

class DetailToDoListViewController: UIViewController {

    @IBOutlet weak var imgIconDelete: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
    }

    func prepareView() {
        
        if let imgButton = UIImage(named: "ic_trash") {
            imgIconDelete.image = imgButton
        }
    }
    
    @IBAction func btnDeleteToDoList(_ sender: Any) {
        
        print("Delete ToDoList")
    }
}
