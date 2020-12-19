//
//  NSObject.swift
//  CommonExtension
//
//  Created by 김종권 on 2020/12/19.
//

import Foundation

// CommonExtension/Common/NSObject
public extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }
}
