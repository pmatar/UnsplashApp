//
//  Encodable+Ext.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//


import Foundation

extension Encodable {
    func toDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder.standard.encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(
                with: data,
                options: .fragmentsAllowed
            ) as? [String: Any] else {
                return nil
            }
            
            return dictionary.isEmpty ? nil : dictionary
        } catch {
            Log.error(error)
            return nil
        }
    }
}
