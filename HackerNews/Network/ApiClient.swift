//
//  ApiClient.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Alamofire

class ApiClient {
    
    func fetch(withRequest request: ServiceRequest,
               completion: @escaping ((_ responseData: Any?, _ failure: Error?) -> Void)) {
        let alamofireRequest = Alamofire.request(request.url,
                                                 method: request.httpMethod,
                                                 parameters: request.parameters,
                                                 encoding: request.encoding,
                                                 headers: request.headers)
        alamofireRequest.responseJSON { response in
            guard let value = response.result.value else {
                completion(nil, response.error)
                return
            }
            completion(value, response.error)
        }
    }
}
