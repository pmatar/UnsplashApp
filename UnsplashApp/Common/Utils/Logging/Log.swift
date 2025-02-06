//
//  Log.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//


import Foundation

struct Log {
    public static func request(_ request: URLRequest) {
        let urlString = request.url?.absoluteString ?? ""
        let httpMethod = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let httpBody = request.httpBody?.prettyPrinted ?? ""
        let httpHeaders = (request.allHTTPHeaderFields ?? [:]).map { "\($0): \($1)" }
        
        let start = "---------------➡️  REQUEST  ➡️---------------"
        let date = "DATE: \(Date())"
        let url = "URL: \(urlString)"
        let method = "METHOD: \(httpMethod)"
        let headers = "HEADERS: \(httpHeaders)"
        let body = "BODY: \(httpBody) "
        let end = "---------------➡️    END    ➡️---------------"
        dprint(start, date, url, method, headers, body, end, separator: "\n")
    }
    
    public static func response(_ response: HTTPURLResponse, data: Data) {
        let urlString = response.url?.absoluteString ?? ""
        let httpHeaders = response.allHeaderFields.map { "\($0): \($1)" }
        let dataString = data.prettyPrinted ?? ""
        let start = "- - - - - - - - - - ⬅️  RESPONSE  ⬅️ - - - - - - - - - -"
        let date = "DATE: \(Date())"
        let url = "URL: \(urlString)"
        let headers = "HEADERS: \(httpHeaders)"
        let statusCode = "STATUS CODE: \(response.statusCode)"
        let dataResponse = "RESPONSE: \(dataString)"
        let end = "- - - - - - - - - - ⬅️    END     ⬅️ - - - - - - - - - -"
        dprint(start, date, url, headers, statusCode, dataResponse, end, separator: "\n")
    }
    
    public static func error(_ error: Error) {
        dprint(" ❌ ERROR: \(error.localizedDescription)")
    }
}

extension Log {
    @inlinable static func dprint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        print(items.lazy.map { "\($0)" }.joined(separator: separator), terminator: terminator)
        #endif
    }
}
