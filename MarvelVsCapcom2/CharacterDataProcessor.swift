//
//  CharacterDataProcessor.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/14/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import Foundation


class CharacterDataProcessor {
    static func mapJsonToMovies(object: [[String: AnyObject]]) ->
        [Character] {
            var mappedCharacters: [Character] = []
            guard let characters = object as? [[String : AnyObject]] else {
                return mappedCharacters }
            
            
            for character in characters {
                guard let name = character["name"] as? String,
                    let head_shot = character["head_shot"] as? String,
                    let universe = character["universe"] as? String else { continue }
                let characterClass =  Character(name: name, head_shot: head_shot, universe: universe)
                //print(characterClass)
                mappedCharacters.append(characterClass)
            }
            return mappedCharacters
    }
}
