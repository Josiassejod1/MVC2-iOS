//
//  Moves.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/15/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import Foundation


struct Moves {
    var character_name: String = ""
    var move_name: String = ""
    var  image : String = ""
    init(character_name: String, move_name: String, image: String) {
        self.character_name = character_name
        self.move_name = move_name
        self.image = image
    }
}
