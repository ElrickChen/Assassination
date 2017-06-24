//
//  CharacterTableCell.swift
//  test
//
//  Created by Macintosh on 2017/6/24.
//  Copyright © 2017年 user_08. All rights reserved.
//

import UIKit

class CharacterTableCell: UITableViewCell {
    

    @IBOutlet weak var charName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
