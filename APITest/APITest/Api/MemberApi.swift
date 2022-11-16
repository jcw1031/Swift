//
//  MemberApi.swift
//  APITest
//
//  Created by 지찬우 on 2022/11/16.
//

import Foundation
import Combine
import Alamofire

//class MemberApi: ObservableObject {
//
//    @Published var member = Member(memberId: 0, email: "", password: "", name: "", phone: "", memberType: 0)
//
//
//    init(){
//
//    }
//
//    func findByEmail(email: String){
//        let url = "http://localhost:8080/user/search/" + email
//
//        AF.request(url, method: .get)
//            .responseDecodable(of: [Member].self) {
//                data in guard let data = data.value else {return}
//                self.member = data
//            }
//
//        member[0].printMember()
//    }
//}

//class MemberApi: ObservableObject {
//    @Published var member = Member(from: JSONDecoder)
//
//    var baseUrl = "http://localhost:8080/user/search/jcw001031@gmail.com"
//
//    init(){
//        member.printMember()
//        findByEmail()
//    }
//
//    func findByEmail() {
//        member.printMember()
//        AF.request(baseUrl)
//            .publishDecodable(type: Member.self)
//            .compactMap{$0.value}
//            .sink(receiveCompletion: { completion in
//                print("데이터 스트림 완료")
//            }, receiveValue: { ( receivedValue : [Member]) in
//                print("받은 값 : \(receivedValue)")
//                member = receivedValue
//            })
//    }
//}

func findByEmail(email: String) -> Member{
    let url = "http://localhost:8080/user/email/" + email
    var member: Member = Member()
    
    AF.request(url, method: .get).responseJSON { response in
        print("response : \(response)")
        do{
            let decoder = JSONDecoder()
            switch (response.result) {
                
            case .success:
                member = try decoder.decode(Member.self, from: response.data!)
                
            case .failure(let error):
                print("error code : \(error._code)")
                print("error description :  \(error.errorDescription!)")
            }
            
        } catch let parsingError {
            print("Error : ", parsingError)
        }
    }
    return member
}
