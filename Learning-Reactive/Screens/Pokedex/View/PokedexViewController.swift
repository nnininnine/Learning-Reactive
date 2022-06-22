//
//  PokedexViewController.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 21/6/2565 BE.
//

import Foundation
import UIKit

class PokedexViewController: UIViewController {
    // MARK: Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: Property

    lazy var viewModel: PokedexViewModel = .init()

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {}
}
