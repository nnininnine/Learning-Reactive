//
//  PokedexViewModel.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 22/6/2565 BE.
//

import Foundation
import RxSwift

class PokedexViewModel {
    // MARK: Property

    var pokedexPublisher: PublishSubject<PokemonResults> = .init()
    let disposeBag: DisposeBag = .init()

    // MARK: Init

    init() {}

    // MARK: Methods

    func fetchPokedex() {}
}