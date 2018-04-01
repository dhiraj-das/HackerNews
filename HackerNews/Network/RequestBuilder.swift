//
//  RequestBuilder.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Alamofire

class RequestBuilder {
    
    private var methodType: HTTPMethod = .get
    private var urlString: String?
    private var headers: HTTPHeaders = [:]
    private var parameters: Parameters = [:]
    private var encoding: ParameterEncoding = URLEncoding.default
    
    func ofType(_ type: HTTPMethod) -> Self {
        methodType = type
        return self
    }
    
    func set(urlString: String) -> Self {
        self.urlString = urlString
        return self
    }
    
    func set(headerKey: String, value: String) -> Self {
        self.headers[headerKey] = value
        return self
    }
    
    func set(parameterKey: String, value: String) -> Self {
        self.parameters[parameterKey] = value
        return self
    }
    
    func set(encoding: ParameterEncoding) -> Self {
        self.encoding = encoding
        return self
    }
    
    func build() -> ServiceRequest {
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
            fatalError("Malformed URL")
        }
        
        var serviceRequest = ServiceRequest(url: url, method: methodType)
        serviceRequest.encoding = encoding
        
        if headers.count > 0 {
            serviceRequest.headers = headers
        }
        
        if parameters.count > 0 {
            serviceRequest.parameters = parameters
        }
        
        return serviceRequest
    }
}
