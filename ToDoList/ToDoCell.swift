//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Matvey on 4/9/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        
        delegate?.checkmarkTapped(sender: self)
        
    }
    
}
