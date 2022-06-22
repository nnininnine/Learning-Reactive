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

    var pokemonResult: PokemonResult?
    var pokemonPublisher: PublishSubject<Pokemon> = .init()
    let disposeBag: DisposeBag = .init()
    private let pokemonService: PokemonService = .init()

    // MARK: Init

    init(pokemonResult: PokemonResult) {
        self.pokemonResult = pokemonResult
    }

    init() {
        self.pokemonResult = nil
    }

    // MARK: Methods

    func getPokemonInfo() {
        guard let url = pokemonResult?.url else { return }
        pokemonService.getPokemonInfo(url) { [weak self] success, pokemon, _ in
            if success {
                guard let pokemon: Pokemon = pokemon else { return }

                self?.pokemonPublisher.onNext(pokemon)
            }
        }
    }

    func getPokemonImage(_ url: String?) -> UIImage? {
        guard let url = url else { return nil }
        guard let url = URL(string: url) else { return nil }
        do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)

            return image
        } catch {
            return nil
        }
    }
}
