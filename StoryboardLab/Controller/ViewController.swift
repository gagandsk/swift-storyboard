//
//  ViewController.swift
//  StoryboardLab
//
//  Created by Gagandeep Dass Kaur on 27/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pokemonImage: UIImageView!
    
    lazy var pokemonManager = PokemonManager()
    lazy var imageManager = ImageManager()
    lazy var game = GameModel()
    
    var random4Pokemon: [PokemonModel] = []
    var correctAnswer: String = ""
    var correctAnswerImage: String = ""
    
    @IBOutlet var buttons: UIButton!
    
    //obtener el valor del boton clicado
    @IBAction func actionButtons(_ sender: Any) {
        print((sender as AnyObject).titleLabel?.text ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //aqui, cuando hacemos un 'delegate' le estamos pasando el 'control'
        pokemonManager.delegate = self
        imageManager.delegate = self
       
        print(game.getScore())
        
        pokemonManager.fetchPokemon()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: PokemonManagerDelegate {
    func didUpdatePokemon(pokemons: [PokemonModel]) {
        random4Pokemon = pokemons.choose(4)
        
        let index = Int.random(in: 0...3)
        let imageData = random4Pokemon[index].imageUrl
        correctAnswer = random4Pokemon[index].name
        
        imageManager.fetchImage(url: imageData)
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
}

extension ViewController: ImageManagerDelegate {
    func didUpdateImage(image: ImageModel) {
        print(image.imageURL)
    }
    
    func didFailWithErrorImage(error: any Error) {
        print(error)
    }
    
    
}

extension Collection where Indices.Iterator.Element == Index {
    public subscript(safe index: Index) -> Iterator.Element? {
        return (startIndex <= index && index < endIndex) ? self[index] : nil
    }
}


extension Collection {
    func choose(_ n: Int) -> Array<Element> {
        Array(shuffled().prefix(n))
    }
}
