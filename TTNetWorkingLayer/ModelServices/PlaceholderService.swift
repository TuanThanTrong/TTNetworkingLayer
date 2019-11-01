//
//  PlaceholderService.swift
//  TTNetWorkingLayer
//
//  Created by Than Trong Tuan on 11/1/19.
//  Copyright © 2019 Than Trong Tuan. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

struct PlaceholderService: APIRouter {
    var path: String { return "/posts" }
    
    var parameters: Parameters? {
        return nil
    }
    
    static func getPlaceholder(completion: @escaping (AFDataResponse<[Placeholder]>) -> Void) {
        APIService.performRequest(route: PlaceholderService(), completion: completion)
    }
    
    static func getPlaceholderWithPromise() -> Promise<[Placeholder]> {
        return APIService.performRequestWithPromise(route: PlaceholderService())
    }
}
