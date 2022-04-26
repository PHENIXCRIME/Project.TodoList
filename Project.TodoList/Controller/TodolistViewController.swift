//
//  TodolistViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit
import GoogleSignIn

class TodolistViewController: UIViewController {
    
    @IBOutlet weak var txTitle: UILabel!
    @IBOutlet weak var toDoListTableView: UITableView!
    @IBOutlet weak var viewButtonAdd: UIView!
    @IBOutlet weak var imgButtonAdd: UIImageView!
    @IBOutlet weak var btnAddToDoList: UIButton!
    
    @IBOutlet weak var viewButtonLogout: UIView!
    @IBOutlet weak var imgButtonLogout: UIImageView!
    @IBOutlet weak var btnLogout: UIButton!
    
    var entries: [Entry] = []
    
    static let identifier = "TodolistViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let entriesFromCoreData = try? context.fetch(Entry.fetchRequest()) as? [Entry] {
                entries = entriesFromCoreData
                toDoListTableView.reloadData()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let entryVC = segue.destination as? DetailToDoListViewController {
            
            if let entryToBeSent = sender as? Entry {
                
                entryVC.entry = entryToBeSent
            }
        }
    }
    
    func prepareView() {
        
        view.backgroundColor = AppColor.blue100
        
        txTitle.text = "todo list".uppercased()
        
        viewButtonAdd.backgroundColor = .clear
        
        if let imageAdd = UIImage(named: "ic_add") {
            imgButtonAdd.image = imageAdd
        }
        
        toDoListTableView.rowHeight = UITableView.automaticDimension
        toDoListTableView.separatorStyle = .none
        toDoListTableView.backgroundColor = .clear
        
        viewButtonLogout.backgroundColor = .clear
        
        if let imageLogout = UIImage(named: "ic_out") {
            imgButtonLogout.image = imageLogout
        }
        
        imgButtonLogout.contentMode = .scaleAspectFit
        
        registerCell()
    }
    
    func registerCell() {
        
        toDoListTableView.register(ToDoListCell.self, forCellReuseIdentifier: ToDoListCell.identifier)
        toDoListTableView.register(UINib(nibName: ToDoListCell.identifier, bundle: nil), forCellReuseIdentifier: ToDoListCell.identifier)
    }
    
    @IBAction func btnAddToDoList(_ sender: Any) {
        
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        presentViewController()
    }
    
    func presentViewController() {
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: LoginViewController.identifier) as! LoginViewController
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}

extension TodolistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellToDoList = Bundle.main.loadNibNamed(ToDoListCell.identifier, owner: self, options: nil)?[0] as? ToDoListCell
        
        let entry = entries[indexPath.row]
        
        cellToDoList?.txTaskTitle?.text = entry.textTitle
        
        return cellToDoList!
    }
    
}

extension TodolistViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let entry = entries[indexPath.row]
        
        performSegue(withIdentifier: "segueToEntry", sender: entry)
    }
}
