//
//  QuestionService.swift
//  NetworkingLayer
//
//  Created by Than Trong Tuan on 10/17/19.
//  Copyright © 2019 Than Trong Tuan. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

struct QuestionService: APIRouter {
    var method: HTTPMethod { return .post }
    var path: String { return APIKey.APIUrl.get_Data_Common }
    
    var parameters: Parameters? {
        var params: Parameters = [:]
        if let defaultParams = (self as APIRouter).defaultParameters {
            params = defaultParams
        }
        params["cat_no"] = 1
        return params
    }
    
    static func getQuestion(completion: @escaping (AFDataResponse<Question>) -> Void) {
        APIService.performRequest(route: QuestionService(), completion: completion)
    }
    
    static func getQuestionWithPromise() -> Promise<Question> {
        return APIService.performRequestWithPromise(route: QuestionService())
    }
}
