//
//  ContentView.swift
//  APITest
//
//  Created by 장세희 on 2022/11/16.
//

import SwiftUI

struct ApiView: View {
    
    @State private var isClickedBtn: Bool = false
    @State private var member: Member
    
    init(member: Member){
        self.member = member
    }

    var body: some View {
        Button {
//            member = findByEmail(email: "jcw001031@gmail.com")
//            print(member.printMember())
            
            UserService.shared.getUserInfo{(response) in
                switch(response){
                case .success(let userData):
                    if let data = userData as? UserDataModel{
                        print(data.name)
                    }
                case .requestErr(let message):
                    print("requestErr", message)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            }
            
//            UserService.shared.getUserInfo { (response) in
//                switch(response) {
//                case .success(let userData):
//                }
//
//            }
            isClickedBtn.toggle()
        } label: {
            Text("API 호출")
        }
        .padding()
        if (isClickedBtn) {
            Text("\(member.printMember())")
        }
    }
}

//struct ContentView: View{
//
//    @ObservableObject var memberApi = MemberApi()
//
//    var body: some View{
//        List(memberApi.member){ aMember in
//            ApiView()
//        }
//
////        List(0...100, id: \.self) { index in
////            ApiView()
////        }
//    }
//}
