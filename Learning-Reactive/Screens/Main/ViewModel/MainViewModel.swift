//
//  MainViewModel.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation

class MainViewModel {
    // MARK: Property

    let modules: Modules = [Module(name: "Convert thai digit", storyboardIdentifier: "ThaiDigitStoryboard", identifier: "ThaiDigitViewController")]

    // MARK: Initial

    init() {
        print("init")
    }
}
