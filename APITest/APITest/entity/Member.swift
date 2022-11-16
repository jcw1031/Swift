//
//  Member.swift
//  APITest
//
//  Created by 지찬우 on 2022/11/16.
//

import Foundation

class Member: Codable {
    
    var memberId: Int?
    var email: String?
    var password: String?
    var name: String?
    var phone: String?
    var memberType: Int?
    
    init(){
    }

    func printMember() -> String{
        return "name : \(name), phone : \(phone)"
    }
}
