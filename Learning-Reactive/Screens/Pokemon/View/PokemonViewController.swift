//
//  PokemonViewController.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 22/6/2565 BE.
//

import Foundation
import UIKit

class PokemonViewController: UIViewController {
    // MARK: Outlets

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!

    // MARK: Property

    lazy var viewModel: PokemonViewModel = .init()

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setup()
    }

    func setupUI() {
        nameLabel.text = nil
    }

    func setup() {
        // subscribe
        viewModel.pokemonPublisher.subscribe(onNext: { [weak self] pokemon in
            print(pokemon)
            self?.nameLabel.text = pokemon.name
            self?.navigationItem.title = pokemon.name
        }).disposed(by: viewModel.disposeBag)
    }
}
