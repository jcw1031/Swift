//
//  UserDataModel.swift
//  APITest
//
//  Created by 지찬우 on 2022/11/16.
//

import Foundation

struct UserDataModel: Codable {
    let memberId: Int
    let email: String
    let password: String
    let name: String
    let phone: String
    let memberType: Int
    
    
}
