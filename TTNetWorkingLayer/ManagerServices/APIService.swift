//
//  APIService.swift
//  NetworkingLayer
//
//  Created by Than Trong Tuan on 10/17/19.
//  Copyright © 2019 Than Trong Tuan. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

struct APIService {
    static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping ((AFDataResponse<T>) -> Void)) -> Void {
        AF.request(route)
            .responseDecodable { (response) in
            completion(response)
        }
    }
    
    static func performRequestJson(route:APIRouter, completion: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(route)
            .responseJSON { response in
            completion(response)
        }
    }
    
    static func performRequestWithPromise<T: Decodable>(route: APIRouter) -> Promise<T> {
        return Promise<T>() { seal in
            AF.request(route).responseData { response in
                switch response.result {
                case .success(let value):
                    let decoder = JSONDecoder()
                    do {
                        seal.fulfill(try decoder.decode(T.self, from: value))
                    } catch let e {
                        seal.reject(e)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}
