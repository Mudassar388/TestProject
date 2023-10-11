//
//  ListViewModel.swift
//  TestProject
//
//  Created by Developer on 11/10/2023.
//

import Foundation

class ListViewModel {
    
    var pokemons: [String] = [] 

    func fetchPokemonData(completion: @escaping () -> Void) {

        apiService.shared.makeAPICall(httpMethod: "GET", baseURL: APIConstants.baseURL, endpoint: APIConstants.Endpoints.pokemonList) { [weak self] result in
            guard let self = self else { return }

            if let data = result.data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(PokemonList.self, from: data)
                    self.pokemons = response.results.map { $0.name }
                    completion()
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
    }
    
    func retrieveUsername() -> String? {
            return UserDefaults.standard.string(forKey: "username")
        }
}

