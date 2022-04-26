//
//  TodolistViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit

class TodolistViewController: UIViewController {
    
    @IBOutlet weak var txTitle: UILabel!
    @IBOutlet weak var toDoListTableView: UITableView!
    @IBOutlet weak var imgButtonAdd: UIImageView!
    @IBOutlet weak var btnAddToDoList: UIButton!
    
    var entries: [Entry] = []
    
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
        
        txTitle.text = "todo list".uppercased()
        
        if let imgButton = UIImage(named: "ic_add") {
            imgButtonAdd.image = imgButton
        }
        
        toDoListTableView.rowHeight = UITableView.automaticDimension
        toDoListTableView.separatorStyle = .none
        
        registerCell()
    }
    
    func registerCell() {
        
        toDoListTableView.register(ToDoListCell.self, forCellReuseIdentifier: ToDoListCell.identifier)
        toDoListTableView.register(UINib(nibName: ToDoListCell.identifier, bundle: nil), forCellReuseIdentifier: ToDoListCell.identifier)
    }
    
    @IBAction func btnAddToDoList(_ sender: Any) {
        
        print("ToDoList")
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
