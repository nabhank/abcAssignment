//
//  APIClient.swift
//  abc
//
//  Created by MacBook Pro on 15/06/21.
//

import Foundation
class API : NSObject {

   var session = URLSession.shared

   override init() {
       super.init()
   }
    
    func taskForPOSTMethod(_ method: String, withToken:Bool,jsonBody:String, completionHandlerForPOST: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        let url = URL(string: method)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      print(jsonBody)
        request.httpBody = jsonBody.data(using: String.Encoding.utf8)
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            func sendError(_ error: String) {
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForPOST(nil, NSError(domain: "taskForPOSTMethod", code: 1, userInfo: userInfo))
            }
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            // print data variable
            if String(data: data, encoding: .utf8) != nil{
                //print("Response : \(data)")
            }
            guard let jsonString = String(data: data, encoding: .utf8)  else {
                sendError("Failed converting data to string")
                return
            }
            guard let dataType = jsonString.data(using: .utf8) else {
                sendError("Failed converting back string to data")
                return
            }
            print(dataType)
            self.convertDataWithCompletionHandler(dataType, completionHandlerForConvertData: completionHandlerForPOST)
        }
        task.resume()
        return task
    }
    
    private func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        var parsedResult: AnyObject! = nil
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
            print(parsedResult)
        } catch let error {
            let userInfo = [NSLocalizedDescriptionKey : error]
            completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        completionHandlerForConvertData(parsedResult, nil)
    }
    
    
    class func sharedInstance() -> API {
        struct Singleton {
            static var sharedInstance = API()
        }
        return Singleton.sharedInstance
    }

}
