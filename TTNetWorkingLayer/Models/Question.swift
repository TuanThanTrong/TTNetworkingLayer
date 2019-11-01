//
//  Question.swift
//  NetworkingLayer
//
//  Created by Than Trong Tuan on 10/17/19.
//  Copyright © 2019 Than Trong Tuan. All rights reserved.
//

import Foundation

struct Question: Decodable {
    var question: [String: String]
    var messages: String
    enum CodingKeys: CodingKey {
        case q_name, messages
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        messages = try container.decode(String.self, forKey: .messages)
        question = try container.decode([String: String].self, forKey: .q_name)
    }
}
