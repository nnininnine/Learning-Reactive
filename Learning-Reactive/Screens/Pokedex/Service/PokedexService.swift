//
//  PokedexService.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 22/6/2565 BE.
//

import Foundation

class PokedexService {
    // MARK: Methods

    func getPokedex(completion: @escaping (Bool, PokemonResults?, String?) -> Void) {
        let url: String = PokedexConstants.baseURL + PokedexConstants.pokemonEndpoint

        HttpClient.shared.get(url) { success, data, err in
            if success {
                do {
                    let model = try JSONDecoder().decode(PokemonOverview.self, from: data!)

                    completion(true, model.results, nil)
                } catch let err {
                    completion(false, nil, err.localizedDescription)
                }
            } else {
                completion(false, nil, err)
            }
        }
    }
}
