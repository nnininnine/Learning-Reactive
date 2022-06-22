//
//  MainViewController.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import RxCocoa
import RxSwift
import UIKit

class MainViewController: UIViewController {
    // MARK: Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: Property

    lazy var viewModel: MainViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMainScreen()
    }

    func setupMainScreen() {
        // setup table view
        tableView.register(ModuleCell.nib(), forCellReuseIdentifier: ModuleCell.identifier)

        // binding
        viewModel.observable.bind(to: tableView.rx.items(cellIdentifier: viewModel.cellIdentifier)) { (_, module: Module, cell: ModuleCell) in
            cell.module = module
        }.disposed(by: viewModel.disposeBag)

        tableView.rx.modelSelected(Module.self)
            .subscribe(onNext: { [weak self] module in
                guard let self = self else { return }
                self.viewModel.routeToModule(source: self, module)
            }).disposed(by: viewModel.disposeBag)
    }
}
