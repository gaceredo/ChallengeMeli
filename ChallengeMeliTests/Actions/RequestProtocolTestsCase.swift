//
//  RequestProtocolTestsCase.swift
//  ChallengeMeliTests
//
//  Created by Gustavo Aceredo on 12/6/23.
//

import Foundation
import XCTest
import Combine

class RequestProtocolTests: XCTestCase {
    var session: URLSession!
    var subject: RequestProtocol!
    
    override func setUp() {
        super.setUp()
        session = URLSession(configuration: .default)
        subject = RequestProtocolImpl(session: session)
    }
    
    override func tearDown() {
        session = nil
        subject = nil
        super.tearDown()
    }
    
    func testExecuteSuccessful() {
        // Given
        let response = HTTPURLResponse(url: URL.default, statusCode: 200, httpVersion: nil, headerFields: nil)
        let mockSession = MockURLSession()
        mockSession.data = CreateObjectList.items
        mockSession.response = response
        subject.session = mockSession
        let request = URLRequest(url: URL.default)
        let expectation = XCTestExpectation(description: "Request completion")
        
        // When
        let cancellable = subject.execute(request, decodingType: CategoryItemsModel.self, queue: .main)
            .sink(receiveCompletion: { completion in
                
                // Then
                if case let .failure(error) = completion {
                    XCTFail("Expected successful response, but received error: \(error)")
                }
                expectation.fulfill()
            }, receiveValue: { result in
                XCTAssertEqual(result.results[0].id, "MLA1403897020")
                XCTAssertEqual(result.results[0].title, "Celular Tcl 408 64gb 4gb Ram Gris")
                XCTAssertEqual(result.results[0].thumbnail, "http://http2.mlstatic.com/D_703335-MLU54966016879_042023-I.jpg")
            })
        
        wait(for: [expectation], timeout: 1.0)
        cancellable.cancel()
    }
    
    func testExecuteUnsuccessful() {
        // Given
        let response = HTTPURLResponse(url: URL.default, statusCode: 404, httpVersion: nil, headerFields: nil)
        
        let mockSession = MockURLSession()
        mockSession.data = CreateObjectList.items
        mockSession.response = response
        subject.session = mockSession
        
        let request = URLRequest(url: URL.default)
        
        // When
        let expectation = XCTestExpectation(description: "Request completion")
        let cancellable = subject.execute(request, decodingType: CategoryItemsModel.self, queue: .main)
            .sink(receiveCompletion: { completion in
                // Then
                if case let .failure(error) = completion {
                    XCTAssertEqual(error.message, "Ocurrio un error inesperado")
                } else {
                    XCTFail("Expected unsuccessful response, but received success")
                }
                expectation.fulfill()
            }, receiveValue: { _ in
                XCTFail("Expected unsuccessful response, but received success")
            })
        
        wait(for: [expectation], timeout: 1.0)
        cancellable.cancel()
    }
   
}

struct RequestProtocolImpl: RequestProtocol {
    var session: URLSession
}

extension URL {
    static var `default` = URL(string: "https://api.mercadolibre.com")!
}
