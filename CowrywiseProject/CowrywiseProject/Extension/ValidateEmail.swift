//
//  ValidateEmail.swift
//  CowrywiseProject
//
//  Created by Decagon on 12/05/2021.
//

import Foundation

extension String{
    public var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
