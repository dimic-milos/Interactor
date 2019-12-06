//
//  Models.swift
//  Interactor
//
//  Created by Dimic Milos on 12/6/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import Foundation

public struct ShowBalance {
    
    public struct Request {
        public let id: Int
        public init(id: Int) {
            self.id = id
        }
    }
    public struct Response {
        public let amount: Double
        public init(amount: Double) {
            self.amount = amount
        }
    }
    public struct ViewModel {
        public let saldo: String
        public init(saldo: String) {
            self.saldo = saldo
        }
    }
}
