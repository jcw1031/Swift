//
//  APITestApp.swift
//  APITest
//
//  Created by 장세희 on 2022/11/16.
//

import SwiftUI
import Foundation

var member: Member = Member()

@main
struct APITestApp: App {
    var body: some Scene {
        WindowGroup {
            ApiView(member: member)
        }
    }
}
