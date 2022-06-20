//
//  MainViewModel.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation
import RxSwift

class MainViewModel {
    // MARK: Property

    let observable: Observable<Modules> = Observable.from(optional: [Module(name: "Convert Thai Digit", storyboardIdentifier: "ThaiDigitStoryboard", identifier: "ThaiDigitViewController")] as? Modules ?? [])
    let disposeBag: DisposeBag = .init()
    let cellIdentifier: String = "ModuleCell"

    // MARK: Initial

    init() {
        print("init main view model")
    }

    // MARK: Methods

    func routeToModule(source: MainViewController, _ module: Module) {
        print("navigate to \(module.identifier) from \(source.restorationIdentifier ?? "None")")
    }
}
