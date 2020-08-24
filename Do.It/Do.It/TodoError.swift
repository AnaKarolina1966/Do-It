//
//  TodoError.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 21/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import Foundation

enum TodoError: Error {
    case invalidURL
    case couldNotDecode
    case failedRequest
    case unknownError(statusCode: Int)
}
