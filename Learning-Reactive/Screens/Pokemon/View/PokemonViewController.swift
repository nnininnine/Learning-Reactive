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

    init(url: String) {
        super.init(nibName: nil, bundle: nil)
        viewModel = .init(url: url)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setup() {}
}
