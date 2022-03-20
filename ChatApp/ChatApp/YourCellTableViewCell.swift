//
//  YourCellTableViewCell.swift
//  ChatApp
//
//  Created by 정명곤 on 2022/03/18.
//

import UIKit

class YourCellTableViewCell: UITableViewCell {

    @IBOutlet weak var yourTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
