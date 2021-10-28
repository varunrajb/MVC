//
//  ListTableCell.swift
//  MVVM
//
//  Created by Raji Mac Mini on 28/10/21.
//

import UIKit

class ListTableCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var listOptionLabel: UILabel!
    @IBOutlet weak var optionImageView: UIImageView!
    @IBOutlet weak var cellSelectionStatusImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(info: Option) {
        listOptionLabel.text = info.optionsTitle
        optionImageView.image = UIImage(named: info.optionsImage)
        cellSelectionStatusImageView.image = UIImage(named: info.optionsStatusImage)
    }
}
