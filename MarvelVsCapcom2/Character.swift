//
//  Character.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/14/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import Foundation

struct Character {
    var name: String = ""
    var head_shot: String = ""
    var  universe : String = ""
    init(name: String, head_shot: String, universe: String) {
        self.name = name
        self.head_shot = head_shot
        self.universe = universe
    }
}
