//
//  Payment.swift
//  AdPay
//
//  Created by Korman Chen on 2/20/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import Foundation

enum PaymentType {
    case send
    case receieve
}

class Payment {
    var name: String?
    var code: String?
    var amount: String?
    var type: PaymentType?
    
    init() {}
    
    convenience init(_ name: String, _ code: String, _ amount: String, _ type: PaymentType) {
        self.init()
        
        self.name = name
        self.code = code
        self.amount = amount
        self.type = type
    }
}
