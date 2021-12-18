//
//  Strahd.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/16/21.
//

import Foundation

struct Campaign: Decodable, Identifiable{
    var id: Int
    var title: String
    var sessions: [Session]
}

struct Session: Decodable, Identifiable{
    var id: Int
    var title: String
    var description: String
    var highlights: [String]
    var date:[Int]
    var url: String
}
