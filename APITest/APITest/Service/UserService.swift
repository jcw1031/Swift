//
//  UserService.swift
//  APITest
//
//  Created by 지찬우 on 2022/11/16.
//

import Foundation
import Alamofire

struct UserService {
    static let shared = UserService()
    
    func getUserInfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "http://localhost:8080/user/email/jcw001031@gmail.com"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
        
        print(request.responseData)
        
        request.responseData { response in
            switch response.result {
            case .success :
                guard let statusCode = response.response?.statusCode else {return}
                guard let  value = response.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure : completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(UserDataModel.self, from: data) else {return .pathErr}
        return .success(decodedData)
    }
}
