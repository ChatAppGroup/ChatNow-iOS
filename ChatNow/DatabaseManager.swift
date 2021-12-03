//
//  databaseManager.swift
//  ChatNow
//
//  Created by Chandana Pemmasani on 11/21/21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
//    public func insertUser(with user: chat)
    public func test() {
        database.child("foo").setValue(["something": true])
    }
    
}
