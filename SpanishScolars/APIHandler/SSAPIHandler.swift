//
//  SSAPIHandler.swift
//  SpanishScolars
//
//  Created by kjs on 1/14/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import Foundation

class SSAPIHandler {
    
    static let sharedInstance = SSAPIHandler()
    
    let SSAPIURL: String = "http://spanishscholars.com/api/"
    
    func updateProfileInfo(userName: String, firstName: String, lastName: String, email: String, password: String, callback: ((Bool, AnyObject?) ->())){
        let params = ["user":["Username":userName, "First Name":firstName, "Last Name":lastName, "Email":email, "Password":password]]
        getCommentRequest(Method.PATCH, suburl:"me", params: params).responseJSON{ result in
            if(result.result.isFailure) {
                callback(false, result.result.error!.description);
            }
            else {
                callback(true, nil);
            }
        }
    }
 
    func login(username: String, password: String, callback: ((Bool, AnyObject?) ->())) {
        request(.POST, SSAPIURL + "user/generate_auth_cookie/"+"?username=\(username)&&password=\(password)", parameters: nil, encoding: .JSON).responseJSON {result in
            
            print(result.request)
            print(result.result.error)
            print(result.result.value)
            if(result.result.isFailure) {
                callback(false, result.result.error!.description);
            }
            else {
                var sJSONObj = JSON(result.result.value!);
                if sJSONObj["status"].string == "error"{
                    callback(false, "Signing In is "+sJSONObj["status"].string!)
                }
                else {
                    var cookie : String = String()
                    cookie = sJSONObj["cookie"].string!
                    print(cookie)
                    callback(true, sJSONObj["status"].string);
                }
            }
        }
    }
    
    func signup(username: String, firstname: String, lastname: String, email: String, password: String, doublepassword: String, callback: ((Bool, AnyObject?) ->())) {
        
        var nonce : String = String()
        
        if password != "" && password == doublepassword{
            
            request(.POST, SSAPIURL + "get_nonce/?controller=user&method=register", parameters: nil,encoding: .JSON).responseJSON{ result in
                if(result.result.isFailure) {
                    callback(false, result.result.error!.description);
                }
                else {
                    var sJSONObj = JSON(result.result.value!);
                    
                    if sJSONObj["status"].string == "error"{
                        callback(false, "Register is "+sJSONObj["status"].string!)
                    }
                    else {
                        nonce = sJSONObj["nonce"].string!
                        
                        request(.POST, self.SSAPIURL+"user/register/?username=\(username)&email=\(email)&nonce=\(nonce)&display_name=\(firstname)&first_name=\(firstname)&last_name=\(lastname)&user_pass=\(password)", parameters: nil,encoding: .JSON).responseJSON{ result in
                            
                            print(email)
                            
                            if(result.result.isFailure) {
                                callback(false, result.result.error!.description);
                            }
                            else {
                                var sJSONObj1 = JSON(result.result.value!);
                                print(sJSONObj1)
                                if sJSONObj1["status"].string == "error"{
                                    callback(false, "Register is "+sJSONObj["email"].string!)
                                }
                                else {
                                    callback(true,"okay")
                                }
                            }
                        }
                        
                    }
                    
                }
            }

        }else{
            callback(false,"Password is non-0correct or you don't confirm the password again. Please input Password correctly again")
        }
        
        
    }
    
    func getCommentRequest(mode: Method, suburl: String, params: [String: AnyObject]? = nil) ->Request {
        let URL = NSURL(string: SSAPIURL)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(suburl))
        
        
        mutableURLRequest.HTTPMethod = mode.rawValue
//        mutableURLRequest.setValue(SSCacheHandler.sharedInstance.getSavedUserCredentials().auth_token, forHTTPHeaderField: "X-Api-Key")
        //        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request(ParameterEncoding.URL.encode(mutableURLRequest, parameters: params).0)
    }

}

//http://spanishscholars.com/api/user/register/?username=aaa&email=aaa@domain.com&nonce=31b6c14536&display_name=aaa&first_name=aaa&last_name=aaa&user_pass=12345
/*
request(.POST, self.SSAPIURL + "user/generate_auth_cookie/"+"?username=\(username)&email=\(email)&nonce=\(nonce)&display_name=\(firstname)&first_name=\(firstname)&last_name=\(lastname)&user_pass=\(password)", parameters: nil, encoding: .JSON).responseJSON { result in
if(result.result.isFailure) {
callback(false, result.result.error!.description);
}
else {
var sJSONObj1 = JSON(result.result.value!);
print(self.SSAPIURL)
print("result_value\(result.result.value)")
print(password)
if sJSONObj1["status"].string == "error"{
callback(false, "Register is "+sJSONObj1["status"].string!)
}
else {
callback(true, sJSONObj1["status"].string);
}
}
}

*/

