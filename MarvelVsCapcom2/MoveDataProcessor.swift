//
//  MoveDataProcessor.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/15/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import Foundation

class MoveDataProcessor {
    static func mapJsonToMoves(object: [[String: AnyObject]]) ->
        [Moves] {
            var mappedMoves: [Moves] = []
            guard let moves = object as? [[String : AnyObject]] else {
                return mappedMoves }
            
            for move in moves {
                guard let character_name = move["character_name"] as? String,
                    let image = move["image"] as? String,
                    let move = move["move_name"] as? String else { continue }
                let moveClass =  Moves(character_name: character_name, move_name: move, image: image)
                mappedMoves.append(moveClass)
            }
            print(mappedMoves)
            return mappedMoves
    }
}
