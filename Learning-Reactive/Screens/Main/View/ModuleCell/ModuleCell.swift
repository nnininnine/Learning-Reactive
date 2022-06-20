//
//  ModuleCell.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import UIKit

class ModuleCell: UITableViewCell {
    static let identifier = "ModuleCell"

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    // MARK: Outlets

    @IBOutlet var nameLabel: UILabel!

    // MARK: Property

    var module: Module? {
        didSet {
            nameLabel.text = module?.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
