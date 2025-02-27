//
//  PokemonManager.swift
//  StoryboardLab
//
//  Created by Gagandeep Dass Kaur on 27/2/25.
//

import Foundation

protocol PokemonManagerDelegate {
    func didUpdatePokemon(pokemons: [PokemonModel])
    func didFailWithError(error: Error)
}

struct PokemonManager {
    //consumir una api
    let apiURL = "https://pokeapi.co/api/v2/pokemon?limit=898&offset=0"
    var delegate: PokemonManagerDelegate?
    
    func fetchPokemon() {
        performRequest(with: apiURL)
    }
    
    private func performRequest(with urlString: String) {
        // 1. Create/get URL
        if let url = URL(string: urlString) {
            //  2. Create the URLSession
            let session = URLSession(configuration: .default)
            //  3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                
                if let safeData = data {
                    if let pokemon = self.parseJson(pokemonData: safeData) {
                        self.delegate?.didUpdatePokemon(pokemons: pokemon)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJson(pokemonData: Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(PokemonData.self, from: pokemonData)
            let pokemon = decodeData.results?.map{
                PokemonModel(name: $0.name ?? "" , imageUrl: $0.url ?? "")
            }
            
            return pokemon
        } catch {
            return nil
        }
    }
}
