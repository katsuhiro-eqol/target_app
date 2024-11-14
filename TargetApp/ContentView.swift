//
//  ContentView.swift
//  TargetApp
//
//  Created by Apple on 2024/11/13.
//

import SwiftUI

struct ContentView: View {
    @State var text = "new app"
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(text)
            Spacer()
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                postData()
            }
        }
        .padding()
    }
}

func changeText(text:String)->String{
    if (text == "new app"){
        return "second app"
    } else {
        return "new app"
    }
}

func postData(){
let testurl = URL(string: "https://next-line.onrender.com/api/cron")
    let request = NSMutableURLRequest(url: testurl!)

    // set the method(HTTP-POST)
    request.httpMethod = "POST"
    // set the header(s)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    // set the request-body(JSON)
    let params: [String: Any] = [
        "key": "cronToken",
    ]
//または以下のような記述
//        var params = Dictionary<String,String>()
//        params["testNumber"] = "123567"

    do{
        request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
    }catch{
        print(error.localizedDescription)
    }

    // use NSURLSessionDataTask
    let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
        if (error == nil) {
            let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
            print(result)
        } else {
            print(error as Any)
        }
    })
    task.resume()
}


#Preview {
    ContentView()
}
