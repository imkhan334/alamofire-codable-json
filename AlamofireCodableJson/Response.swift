//
//  Response.swift
//  CodableJson
//
//  Created by Imran Khan on 14/12/2019.
//
//  Copyright (c) 2019 Imran Khan.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation


enum StatusCode : Int {
    case success = 0
    case failure = 1
}

struct Response<T> {
    
    var statusCode:StatusCode
    var messages:[String]?
    //    var validationMessages:[String]?
    //    var exception : String?
    var data:T?
    
    init(withStatus status:StatusCode, failureMessages:[String]?, data:T?) {
        self.statusCode = status
        self.messages = failureMessages
        //        self.validationMessages = validationMessages
        //        self.exception = exception
        self.data = data
    }
    
    init(withData data:T) {
        self.statusCode = .success
        self.messages = nil
        //        self.validationMessages = nil
        //        self.exception = nil
        self.data = data
    }
    
    init(withFailureMessages failureMessages:[String]) {
        self.statusCode = .failure
        self.messages = failureMessages
        //        self.validationMessages = nil
        //        self.exception = nil
        self.data = nil
    }
    
    //    init(withException exception:String) {
    //        self.statusCode = .exception
    //        self.messages = nil
    ////        self.validationMessages = nil
    ////        self.exception = exception
    //        self.data = nil
    //    }
    
    //    init(withValidationMessages validationMessages:[String]) {
    //        self.statusCode = .validation
    //        self.messages = nil
    //        self.data = nil
    //    }
    
    //    enum CodingKeys: String, CodingKey {
    //        case statusCode = "Status", errorMessages = "ErrorMessages",validationMessages = "ValidationMessages",exception="Exception", data = "Data"
    //    }
    
}
