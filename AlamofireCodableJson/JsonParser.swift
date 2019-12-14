//
//  JsonParser.swift
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
import Alamofire

class JsonParser: NSObject {
    
    var headers : HTTPHeaders?
    
    init(withHeaders headers: HTTPHeaders) {
        self.headers = headers
    }
    
    public func getAll<T:Codable>(url:String, params:Parameters, clazz:T.Type, completion:@escaping (Response<[T]>)->()) {
        
        self.request(url: url,method: .get, params: params,encoding: URLEncoding.queryString, clazz: [[String:Any]].self) { (cResponse) in
            
            switch cResponse.statusCode {
                
            case .success:
                
                do {
                    if let dic = cResponse.data {
                        
                        var listOfItems = [T]()
                        
                        for item:[String:Any] in dic {
                            let jsonData = try JSONSerialization.data(withJSONObject: item, options: .prettyPrinted)
                            let decoder = JSONDecoder()
                            let aItem:T = try decoder.decode(clazz, from: jsonData)
                            listOfItems.append(aItem)
                        }
                        
                        let response = Response(withData: listOfItems)
                        completion(response)
                    } else {
                        let response = Response<[T]>(withStatus: StatusCode.success, failureMessages: nil, data: nil)
                        completion(response)
                    }
                    
                } catch {
                    let response = Response<[T]>(withFailureMessages: ["Data object parsing issue >> \(error.localizedDescription)"])
                    completion(response)
                }
                break
                
            case .failure:
                let response = Response<[T]>(withFailureMessages: cResponse.messages ?? ["failureMessages does not have value in response"])
                completion(response)
                break
                
                //            case .validation:
                //                let response = Response<[T]>(withValidationMessages: cResponse.validationMessages ?? ["validationMessages does not have value in response"])
                //                completion(response)
                //                break
                //
                //            case .exception:
                //                let response = Response<[T]>(withException: cResponse.exception ?? "exception does not have value in response")
                //                completion(response)
                //                break
            }
        }
        
    }
    
    public func get<T:Codable>(url:String, params:Parameters, clazz:T.Type, completion:@escaping (Response<T>)->()) {
        
        self.request(url: url,method: .get, params: params,encoding: URLEncoding.queryString , clazz: [String:Any].self) { (cResponse) in
            
            switch cResponse.statusCode {
                
            case .success:
                
                do {
                    if let dic = cResponse.data {
                        
                        let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let aItem:T = try decoder.decode(clazz, from: jsonData)
                        
                        let response = Response(withData: aItem)
                        completion(response)
                    } else {
                        let response = Response<T>(withStatus: StatusCode.success, failureMessages: nil, data: nil)
                        completion(response)
                    }
                    
                } catch {
                    let response = Response<T>(withFailureMessages: ["Data object parsing issue >> \(error.localizedDescription)"])
                    completion(response)
                }
                break
                
            case .failure:
                let response = Response<T>(withFailureMessages: cResponse.messages ?? ["failureMessages does not have value in response"])
                completion(response)
                break
                
                //            case .validation:
                //                let response = Response<T>(withValidationMessages: cResponse.validationMessages ?? ["validationMessages does not have value in response"])
                //                completion(response)
                //                break
                //
                //            case .exception:
                //                let response = Response<T>(withException: cResponse.exception ?? "exception does not have value in response")
                //                completion(response)
                //                break
            }
            
        }
        
    }
    
    public func post<T:Codable>(url:String, params:Parameters, clazz:T.Type, completion:@escaping (Response<T>)->()) {
        
        self.request(url: url,method: .post, params: params,encoding: JSONEncoding.default , clazz: [String:Any].self) { (cResponse) in
            
            switch cResponse.statusCode {
                
            case .success:
                
                do {
                    if let dic = cResponse.data {
                        
                        let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let aItem:T = try decoder.decode(clazz, from: jsonData)
                        
                        let response = Response(withData: aItem)
                        completion(response)
                    } else {
                        let response = Response<T>(withStatus: StatusCode.success, failureMessages: nil, data: nil)
                        completion(response)
                    }
                    
                } catch {
                    let response = Response<T>(withFailureMessages: ["Data object parsing issue >> \(error.localizedDescription)"])
                    completion(response)
                }
                break
                
            case .failure:
                let response = Response<T>(withFailureMessages: cResponse.messages ?? ["failureMessages does not have value in response"])
                completion(response)
                break
                
                //            case .validation:
                //                let response = Response<T>(withValidationMessages: cResponse.validationMessages ?? ["validationMessages does not have value in response"])
                //                completion(response)
                //                break
                //
                //            case .exception:
                //                let response = Response<T>(withException: cResponse.exception ?? "exception does not have value in response")
                //                completion(response)
                //                break
            }
            
        }
        
    }
    
    public func put<T:Codable>(url:String, params:Parameters, clazz:T.Type, completion:@escaping (Response<T>)->()) {
        
        self.request(url: url,method: .put, params: params,encoding: JSONEncoding.default , clazz: [String:Any].self) { (cResponse) in
            
            switch cResponse.statusCode {
                
            case .success:
                
                do {
                    if let dic = cResponse.data {
                        
                        let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let aItem:T = try decoder.decode(clazz, from: jsonData)
                        
                        let response = Response(withData: aItem)
                        completion(response)
                    } else {
                        let response = Response<T>(withStatus: StatusCode.success, failureMessages: nil, data: nil)
                        completion(response)
                    }
                    
                } catch {
                    let response = Response<T>(withFailureMessages: ["Data object parsing issue >> \(error.localizedDescription)"])
                    completion(response)
                }
                break
                
            case .failure:
                let response = Response<T>(withFailureMessages: cResponse.messages ?? ["failureMessages does not have value in response"])
                completion(response)
                break
            }
            
        }
        
    }
    
    public func delete<T:Codable>(url:String, params:Parameters, clazz:T.Type, completion:@escaping (Response<T>)->()) {
        
        self.request(url: url,method: .delete, params: params,encoding: JSONEncoding.default, clazz: [String:Any].self) { (cResponse) in
            
            switch cResponse.statusCode {
                
            case .success:
                
                do {
                    if let dic = cResponse.data {
                        
                        let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let aItem:T = try decoder.decode(clazz, from: jsonData)
                        
                        let response = Response(withData: aItem)
                        completion(response)
                    } else {
                        let response = Response<T>(withStatus: StatusCode.success, failureMessages: nil, data: nil)
                        completion(response)
                    }
                    
                } catch {
                    let response = Response<T>(withFailureMessages: ["Data object parsing issue >> \(error.localizedDescription)"])
                    completion(response)
                }
                break
                
            case .failure:
                let response = Response<T>(withFailureMessages: cResponse.messages ?? ["failureMessages does not have value in response"])
                completion(response)
                break
            }
            
        }
        
    }
    
    public func request<T>(url:String,method:HTTPMethod, params:Parameters,encoding:ParameterEncoding, clazz:T.Type, completion:@escaping (Response<T>)->()) {
        
        Alamofire.request(url, method: method, parameters: params, encoding: encoding, headers: self.headers)
            .responseJSON(completionHandler: { serverResposne in
                
                switch serverResposne.result {
                case .success(let value):
                    
                    if let rootJsonObject = value as? Dictionary<String, Any> {
                        
                        //                        let status: StatusCode = StatusCode(rawValue: rootJsonObject["Status"] as? Int ?? 2) ?? .exception
                        //                        let failureMessages: [String]? = rootJsonObject["ErrorMessages"] as? [String]
                        //                        let validationMessages: [String]? = rootJsonObject["ValidationMessages"] as? [String]
                        //                        let exception: String? = rootJsonObject["Exception"] as? String
                        //
                        
                        if let msg = rootJsonObject["Message"] as? String {
                            let response = Response<T>(withFailureMessages: [msg])
                            completion(response)
                        } else if let data = rootJsonObject["Data"] as? T {
                            let response = Response<T>(withData: data)
                            completion(response)
                        } /*else if let data = rootJsonObject["Data"] as? [Int] {
                             let response = Response(withData: data)
                             completion(response)
                         } */else {
                            
                            let response = Response<T>(withStatus: StatusCode.success, failureMessages: nil, data: nil)
                            //                            let response = Response<T>(withFailureMessages: ["Data can not be converted to \(T.self)"])
                            completion(response)
                        }
                        
                        //                        let response = Response(withStatus: .success, failureMessages: failureMessages, validationMessages: validationMessages, exception: exception, data: data)
                        
                        
                        
                        
                    } else {
                        //                        let response = Response<T>(withException: "Response is not in json format.")
                        let response = Response<T>(withFailureMessages: ["Invalid server response."])
                        completion(response)
                    }
                    break
                    
                case .failure(let error):
                    //
                    ////                    let response:Response<T> = Response(withException: "\(error.localizedDescription)")
                    //
                    //
                    //                    if let data = serverResposne.data {
                    //                        let json = String(data: data, encoding: String.Encoding.utf8)
                    //                        let response = Response<T>(withFailureMessages: )
                    //                        completion(response)
                    //                    }
                    //
                    //
                    //
                    var response = Response<T>(withFailureMessages: [error.localizedDescription])
                    
                    do {
                        if let sData = serverResposne.data {
                            if let jsonDictionary = try JSONSerialization.jsonObject(with: sData, options: []) as? [String:Any] {
                                let msg = jsonDictionary["Message"] as! String
                                response = Response<T>(withFailureMessages: [msg])
                            }
                        }
                    } catch {
                        response = Response<T>(withFailureMessages: ["Data object parsing issue >> \(error.localizedDescription)"])
                    }
                    
                    
                    
                    completion(response)
                    break
                }
            })
        
    }
    
}
