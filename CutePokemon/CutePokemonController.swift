//
//  CutePokemonController.swift
//  CutePokemon
//
//  Created by 이건준 on 2022/02/11.
//

import UIKit


struct Pokemon {
    let pokemonImageUrl: String
    let pokemonName: String
    let pokemonType: String
    let pokemonNumber: Int
}

class CutePokemonController: UIViewController {
    
    let pokemons: [Pokemon] = [
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%91%E1%85%B5%E1%84%8F%E1%85%A1%E1%84%8E%E1%85%B2.png?alt=media&token=68c2ffff-81a5-4db9-a67e-b776242cea02", pokemonName: "피카츄", pokemonType: "전기", pokemonNumber: 025),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%8C%E1%85%A1%E1%86%B7%E1%84%86%E1%85%A1%E1%86%AB%E1%84%87%E1%85%A9.png?alt=media&token=e040d3d4-dd5e-4d81-b5e8-55c44c4f1606", pokemonName: "잠만보", pokemonType: "노말", pokemonNumber: 143),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A1%E1%86%BC%E1%84%92%E1%85%A2%E1%84%8A%E1%85%B5.png?alt=media&token=90aafed7-36d4-4da9-84f0-05285a8184d2", pokemonName: "이상해씨", pokemonType: "풀", pokemonNumber: 001),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%8C%E1%85%B2%E1%84%87%E1%85%A6%E1%86%BA.png?alt=media&token=c3ed67c4-fc4b-4122-9c4c-e75e3c18b6b6", pokemonName: "쥬벳", pokemonType: "비행", pokemonNumber: 041),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%82%E1%85%A1%E1%84%8B%E1%85%A9%E1%86%BC.png?alt=media&token=8c14389d-10ad-4c5a-9562-2088316afab5", pokemonName: "나옹", pokemonType: "노말", pokemonNumber: 052),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%8B%E1%85%B5%E1%84%87%E1%85%B3%E1%84%8B%E1%85%B5.png?alt=media&token=bfd54682-7519-4ed9-a800-ca213b858a7f", pokemonName: "이브이", pokemonType: "노말", pokemonNumber: 133),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%91%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%85%E1%85%B5.png?alt=media&token=9f5dba67-0857-4d21-8ffb-d92db0d54566", pokemonName: "파이리", pokemonType: "불", pokemonNumber: 004),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%81%E1%85%A9%E1%84%87%E1%85%AE%E1%84%80%E1%85%B5.png?alt=media&token=4c72eb7f-ab20-4184-8019-fe3033ee6fbe", pokemonName: "꼬부기", pokemonType: "물", pokemonNumber: 007),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%88%E1%85%AE%E1%86%AF%E1%84%8E%E1%85%AE%E1%86%BC%E1%84%8B%E1%85%B5.png?alt=media&token=e9f65eea-70c6-486a-a647-876105edbf51", pokemonName: "뿔충이", pokemonType: "벌레", pokemonNumber: 013),
        Pokemon(pokemonImageUrl: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%80%E1%85%A9%E1%84%85%E1%85%A1%E1%84%91%E1%85%A1%E1%84%83%E1%85%A5%E1%86%A8.png?alt=media&token=1bc8cf35-e38b-4726-b5ec-844b0851c035", pokemonName: "고라파덕", pokemonType: "물", pokemonNumber: 054),
    ]
    
    let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        title = "포켓몬도감"
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CutePokemonCell.self, forCellReuseIdentifier: CutePokemonCell.identifier)
    }
}

extension CutePokemonController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CutePokemonCell.identifier, for: indexPath) as? CutePokemonCell ?? CutePokemonCell()
        let pokemon = pokemons[indexPath.row]
        cell.configureUI(pokemon: pokemon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
