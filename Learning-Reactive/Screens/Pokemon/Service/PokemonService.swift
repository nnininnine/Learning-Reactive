//
//  PokemonService.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 22/6/2565 BE.
//

import Foundation

class PokemonService {
    // MARK: Methods

    func getPokemonInfo(_ url: String, completion: @escaping (Bool, Pokemon?, String?) -> Void) {
        HttpClient.shared.get(url) { success, data, err in
            if success {
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data!)

                    completion(true, pokemon, nil)
                } catch let err {
                    print(err.localizedDescription)
                    completion(false, nil, err.localizedDescription)
                }
            } else {
                completion(false, nil, err)
            }
        }
    }
}
