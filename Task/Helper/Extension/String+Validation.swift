//
//  String+Validation.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import Foundation

extension String {

    var isNotEmpty:Bool{
        return !isEmpty
    }

    /// This will check whether a string is empty or not by remove all spaces
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }

    /// This will check wheher a string is a valid email or not.
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)

    }

    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }

    func isValidInRange(minLength min: Int = 0, maxLength max: Int) -> Bool {
        if self.count >= min && self.count <= max {
            return true
        }
        return false
    }

    func replace(_ string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }

    var trim: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }


    var trimmed: String {
        let components = self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    var isContainsWhitespace : Bool {
        return(self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }

//    var localized: String {
//        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
//
//    }

    var isValidZip: Bool {
        let postalcodeRegex = "^[0-9]{5}(-[0-9]{4})?|[0-9]{5}$"
        let pinPredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
        let bool = pinPredicate.evaluate(with: self) as Bool
        return bool
    }

    var initial: String {
        var initals = String()
        let names = self.components(separatedBy: " ")
        for name in names {
            if let firstChar = name.first {
                initals.append(firstChar)
            }
        }
        return initals
    }

}


extension Optional where Wrapped == String {
    var isBlank: Bool {
        guard var value = self else { return true }
//        value = value.trimmed
        return value.isEmpty
    }

    var isEmail: Bool {
        guard var email = self else { return false }
        email = email.trimmed
        return email.isEmail
    }

    var isPhoneNumber: Bool {
        guard var phoneNumber = self else { return false }
        phoneNumber = phoneNumber.trimmed
        return phoneNumber.isPhoneNumber
    }
    
    var trimmed: String {
        guard let str = self else {
            return ""
        }
        return str.trimmed
    }
    var addTrailingAndLeadingSpace: String {
        guard let value = self else { return " " }
        return "    " + value + "   "
    }
    var isContainsWhitespace : Bool {
        guard let value = self else { return false}
        return(value.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }
}

