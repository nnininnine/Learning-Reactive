//
//  PokemonViewModel.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 22/6/2565 BE.
//

import Foundation
import RxSwift

class PokemonViewModel {
    // MARK: Property

    private var url: String?
    var pokemonPublisher: PublishSubject<Pokemon> = .init()
    let disposeBag: DisposeBag = .init()
    private let pokemonService: PokemonService = .init()

    // MARK: Init

    init(url: String) {
        self.url = url
    }

    init() {
        self.url = nil
    }

    // MARK: Methods

    func getPokemonInfo() {}
}
