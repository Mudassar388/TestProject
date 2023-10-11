//
//  ListTableViewCell.swift
//  TestProject
//
//  Created by Developer on 11/10/2023.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withName name: String) {
          lblName.text = name
      }
    
}
