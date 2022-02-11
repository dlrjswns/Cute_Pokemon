//
//  Font.swift
//  CutePokemon
//
//  Created by 이건준 on 2022/02/11.
//

import UIKit

class CutePokemonLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
