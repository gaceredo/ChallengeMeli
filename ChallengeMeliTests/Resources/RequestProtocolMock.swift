//
//  RequestProtocolMock.swift
//  ChallengeMeliTests
//
//  Created by Gustavo Aceredo on 12/6/23.
//

import Foundation

class MockURLSession: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.data, self.response, self.error)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let completionHandler: () -> Void
    
    init(completionHandler: @escaping () -> Void) {
        self.completionHandler = completionHandler
    }
    
    override func resume() {
        completionHandler()
    }
}
