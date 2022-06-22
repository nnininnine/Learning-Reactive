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

    // MARK: Property

    lazy var viewModel: PokemonViewModel = .init()

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        print(viewModel.url ?? "url is nil")
    }
}
