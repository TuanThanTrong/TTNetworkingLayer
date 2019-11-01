//
//  Constants.swift
//  NetworkingLayer
//
//  Created by Than Trong Tuan on 10/11/19.
//  Copyright © 2019 Than Trong Tuan. All rights reserved.
//

import Foundation
struct APIKey {
    
    struct APIParameterKey {
        static let userID = "user_id"
        static let accessKey = "access_key"
    }
    
    struct APIParameterValue {
        static let userID = "......."
        static let accessKey = "......"
    }
    
    struct APIUrl {
        static let baseURL = "http://jsonplaceholder.typicode.com"
        static let get_Data_Common =  "...."
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
