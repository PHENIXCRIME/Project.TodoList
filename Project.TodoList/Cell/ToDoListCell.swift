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
    
    var isMarked: Bool = false
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        prepareView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
    func prepareView() {
        
        viewCell.backgroundColor = AppColor.grayF7
        viewCell.layer.cornerRadius = 15
        viewBtnCheck.backgroundColor = .clear
        
        imgBtnCheck.image = UIImage(named: "ic_unchecked")?.withRenderingMode(.alwaysOriginal)
    }
    
    @IBAction func btnCheck(_ sender: Any) {
        
        if isMarked {
            
            isMarked = false
            imgBtnCheck.image = UIImage(named: "ic_checked")?.withRenderingMode(.alwaysOriginal)
        } else {
            
            isMarked = true
            imgBtnCheck.image = UIImage(named: "ic_unchecked")?.withRenderingMode(.alwaysOriginal)
        }
    }
}
