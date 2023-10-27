//
//  ObjectDictionary.swift
//  todo
//
//  Created by Gheorghe Curca on 27.10.2023.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data)
            return json as! [String : Any]
        } catch {
            return [:]
        }
    }
}
