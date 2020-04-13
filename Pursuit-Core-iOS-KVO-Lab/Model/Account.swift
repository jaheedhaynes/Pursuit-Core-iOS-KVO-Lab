//
//  Account.swift
//  Pursuit-Core-iOS-KVO-Lab
//
//  Created by Jaheed Haynes on 4/12/20.
//  Copyright © 2020 Jaheed Haynes. All rights reserved.
//

import Foundation

@objc
class UserAccount: NSObject {
    static var shared = UserAccount()
    var userName: String = ""
    @objc dynamic var userBalance: Double
    override  init() {
        userBalance = 0.0
    }
}

@objc
class AllUsers: NSObject {
    static var shared = AllUsers()
    @objc dynamic var allUsers = [UserAccount]()
    private override init() {
        allUsers = []
    }
}
