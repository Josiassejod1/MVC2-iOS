//
//  JsonParser.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/14/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import Foundation

class JsonParser {
    static func parse(data: Data) -> [[String: AnyObject]]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            print(data)
            let json = try JSONSerialization.jsonObject(with: data, options: options) as? [[String: AnyObject]]
            return json!
        } catch (let parseError) {
            print("There was an error parsing the JSON: \(parseError.localizedDescription)")
        }
        return nil
    }
}
