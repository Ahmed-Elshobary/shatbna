//
//  ShatbnaAPIClient.swift.swift
//  Shatbna
//
//  Created by ahmed elshobary on 12/26/2022.
//  Copyright © 2022 ahmed elshobary. All rights reserved.
//

import UIKit
import Alamofire

class ShatbnaAPIClient: NSObject {
    
    class func requesrAPI(url: String , params:[String: Any]? = nil , method: Alamofire.HTTPMethod, encoding:ParameterEncoding, header:[String:String]? = nil, completionHandler:@escaping (Any?,Bool?,Int?) -> Void){
        requestAPI(url: url, params: params, method: method, encoding: encoding, header: header) { (response, status, statusCode, headers) in
            completionHandler(response, status, statusCode)
        }
    }
    
    class func requestAPI(url: String , params:[String: Any]? = nil , method: Alamofire.HTTPMethod, encoding:ParameterEncoding, header:[String:String]? = nil, completionHandler:@escaping (Any?,Bool?,Int?,[AnyHashable: Any]?) -> Void){
        
        guard let urlItem = URL(string: url) else { return }
        let sessionManager = Alamofire.SessionManager.default
        let oauthHandler = OAuth2Handler()
        sessionManager.adapter = oauthHandler
        sessionManager.retrier = oauthHandler
        var metric = HTTPMetric(url: urlItem, httpMethod: .get)
        if method == .post{
            metric = HTTPMetric(url: urlItem, httpMethod: .post)
        }else if method == .put{
            metric = HTTPMetric(url: urlItem, httpMethod: .put)
        }
        metric?.start()
        sessionManager.request(url, method: method, parameters: params,encoding: encoding, headers: header).validate(statusCode: 200..<401).responseJSON { (response) in
            if response.result.value != nil {
                completionHandler(response.result.value, true, response.response?.statusCode, response.response?.allHeaderFields)
            } else if let error = response.result.error {
                if error._code == NSURLErrorTimedOut || error._code == NSURLErrorNotConnectedToInternet {
                    completionHandler(error.localizedDescription, false, error._code, response.response?.allHeaderFields)
                } else {
                    completionHandler(error.localizedDescription, false, response.response?.statusCode, response.response?.allHeaderFields)
                }
            } else {
                completionHandler(nil, false, response.response?.statusCode, response.response?.allHeaderFields)
            }
        }
    }
}
