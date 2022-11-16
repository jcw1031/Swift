//
//  NetworkResult.swift
//  APITest
//
//  Created by 지찬우 on 2022/11/16.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
