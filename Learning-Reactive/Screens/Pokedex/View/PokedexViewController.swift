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

        setupTableView()
        setup()
    }

    func setupTableView() {
        tableView.register(PokedexCell.nib(), forCellReuseIdentifier: PokedexCell.identifier)
    }

    func setup() {
        viewModel.pokedexPublisher.bind(to: tableView.rx.items(cellIdentifier: PokedexCell.identifier)) { (_, pokemon: PokemonResult, cell: PokedexCell) in
            cell.pokemon = pokemon
        }.disposed(by: viewModel.disposeBag)

        // get data
        viewModel.getPokedex()
    }
}
