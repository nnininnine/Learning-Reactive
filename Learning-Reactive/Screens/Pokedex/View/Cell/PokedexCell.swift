//
//  PokedexCell.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 22/6/2565 BE.
//

import UIKit

class PokedexCell: UITableViewCell {
    // MARK: Class Property

    static let identifier = "PokedexCell"

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    // MARK: Outlets

    @IBOutlet private var nameLabel: UILabel!

    // MARK: Property

    var pokemon: PokemonResult? {
        didSet {
            nameLabel.text = pokemon?.name.capitalized
        }
    }

    // MARK: Init

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
