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
    @IBOutlet private var heightLabel: UILabel!
    @IBOutlet private var weightLabel: UILabel!
    @IBOutlet private var typesLabel: UILabel!

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
        heightLabel.text = nil
        weightLabel.text = nil
        navigationItem.title = viewModel.pokemonResult?.name.capitalized

        // set image border radius
        imageView.layer.cornerRadius = 8
    }

    func setup() {
        // subscribe
        viewModel.pokemonPublisher.subscribe(onNext: { [weak self] pokemon in
            // setup infomation
            self?.heightLabel.text = String(format: "%.2f m.", Double(pokemon.height) / 10)
            self?.weightLabel.text = String(format: "%.2f kg.", Double(pokemon.weight) / 10)

            // setup image
            self?.imageView.image = self?.viewModel.getPokemonImage(pokemon.sprites.frontDefault)
        }).disposed(by: viewModel.disposeBag)

        // get pokemon data
        viewModel.getPokemonInfo()
    }
}
