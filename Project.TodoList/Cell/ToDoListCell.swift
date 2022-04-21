//
//  ToDoListCell.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit

class ToDoListCell: UITableViewCell {

    static let identifier = "ToDoListCell"
    
    @IBOutlet weak var viewCell: UIView!
    
    @IBOutlet weak var viewBtnCheck: UIView!
    @IBOutlet weak var imgBtnCheck: UIImageView!
    @IBOutlet weak var btnCheck: UIButton!
    
    @IBOutlet weak var txTaskTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func prepareView() {
        
        viewCell.backgroundColor = .gray
        viewCell.layer.cornerRadius = 15
        
    }
    
    @IBAction func btnCheck(_ sender: Any) {
        
        print("Check")
    }
    
}
