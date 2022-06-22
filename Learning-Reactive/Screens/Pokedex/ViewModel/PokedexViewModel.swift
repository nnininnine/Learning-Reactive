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
    private let pokedexService: PokedexService = .init()

    // MARK: Init

    init() {}

    // MARK: Methods

    func getPokedex() {
        pokedexService.getPokedex { [weak self] success, result, err in
            if success {
                guard let pokemonResults: PokemonResults = result else { return }

                self?.pokedexPublisher.onNext(pokemonResults)
            } else {
                print(err ?? "")
            }
        }
    }

    func routeToPokemon(source: PokedexViewController, _ pokemonResult: PokemonResult) {
        let storyboard = UIStoryboard(name: "PokedexStoryboard", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "PokemonViewController") as? PokemonViewController else { return }

        destination.viewModel = .init(pokemonResult: pokemonResult)

        // navigate to destination
        source.show(destination, sender: nil)
    }
}
