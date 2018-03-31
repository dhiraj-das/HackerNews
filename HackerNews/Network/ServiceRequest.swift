//
//  ServiceRequest.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Alamofire

struct ServiceRequest {
    var httpMethod: HTTPMethod = .get
    var url: URL
    var parameters: Parameters?
    var headers: HTTPHeaders?
    var encoding: ParameterEncoding = URLEncoding.default
    
    init(url: URL, method: HTTPMethod) {
        self.url = url
        self.httpMethod = method
    }
}
