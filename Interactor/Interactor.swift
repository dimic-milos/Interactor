//
//  Interactor.swift
//  BankBalanceCleanArchitecture
//
//  Created by Dimic Milos on 11/29/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation
import Entity


public protocol InteractorRequest {
    func showBalance(request: ShowBalance.Request)
}

public protocol InteractorWorker {
    func getBalance(completion: @escaping (Result<Double, Error>) -> ())
}

public protocol InteractorPresenter {
    func presentBalance(response: ShowBalance.Response)
}

public class Interactor: InteractorRequest {

    private let entity = Entity()
    public  var worker: InteractorWorker?
    public  var presenter: InteractorPresenter?
    
    public init() {}
    
    public func showBalance(request: ShowBalance.Request) {
        
        guard entity.canShowBalance(forID: request.id) else {
            return
        }
        
        worker?.getBalance { (result) in
            switch result {
                
            case .success(let balance):
                self.presenter?.presentBalance(response: ShowBalance.Response(amount: balance))
            case .failure(_):
                break
            }
        }
    }

}
