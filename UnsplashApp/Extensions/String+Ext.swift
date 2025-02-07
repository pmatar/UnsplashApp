//
//  String+Ext.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import Foundation

extension String {
    func toDate(format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter.standard
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
