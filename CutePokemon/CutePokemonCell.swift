//
//  CutePokemonCell.swift
//  CutePokemon
//
//  Created by 이건준 on 2022/02/11.
//

import UIKit

class CutePokemonCell: UITableViewCell {
    
    static let identifier = "CutePokemonCell"
    
    let pokemonImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let pokemonNumberLabel: CutePokemonLabel = .init()
    let pokemonNameLabel: CutePokemonLabel = .init()
    let pokemonTypeLabel: CutePokemonLabel = .init()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(pokemonImageView)
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        pokemonImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokemonImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pokemonImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(pokemonNumberLabel)
        pokemonNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNumberLabel.leftAnchor.constraint(equalTo: pokemonImageView.rightAnchor, constant: 40).isActive = true
        pokemonNumberLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(pokemonNameLabel)
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNameLabel.leftAnchor.constraint(equalTo: pokemonImageView.rightAnchor, constant: 40).isActive = true
        pokemonNameLabel.centerYAnchor.constraint(equalTo: pokemonImageView.centerYAnchor).isActive = true
        
        addSubview(pokemonTypeLabel)
        pokemonTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonTypeLabel.leftAnchor.constraint(equalTo: pokemonImageView.rightAnchor, constant: 40).isActive = true
        pokemonTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configureUI(pokemon: Pokemon) {
        let imageUrl = pokemon.pokemonImageUrl
        pokemonImageView.loadImage(imageUrl: imageUrl)
        pokemonNumberLabel.text = "번호    \(pokemon.pokemonNumber)"
        pokemonNameLabel.text = "이름    " + pokemon.pokemonName
        pokemonTypeLabel.text = "타입    " + pokemon.pokemonType
    }
}
