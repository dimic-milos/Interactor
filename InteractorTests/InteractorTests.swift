//
//  InteractorTests.swift
//  InteractorTests
//
//  Created by Dimic Milos on 12/6/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import XCTest
@testable import Interactor

class InteractorTests: XCTestCase {

    func test() {
        XCTAssertNotNil(Interactor())
    }
    
    func test_showBalance() {
        // Given
        let sut = Interactor()
        let worker = WorkerSpy()
        sut.worker = worker
        
        // When
        sut.showBalance(request: ShowBalance.Request(id: 0))
        
        // Then
        XCTAssertEqual(worker.numberOfCalls, 1)
        
    }
    
    
    class WorkerSpy: InteractorWorker {
        var numberOfCalls = 0
        func getBalance(completion: @escaping (Result<Double, Error>) -> ()) {
            numberOfCalls += 1
        }
        
        
    }
    
    

}
