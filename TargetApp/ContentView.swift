//
//  ContentView.swift
//  TargetApp
//
//  Created by Apple on 2024/11/13.
//

import SwiftUI

let bounds = UIScreen.main.bounds
let width = bounds.width
let height = bounds.height

struct ContentView: View {
    @State private var input:String = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("メッセージを入力してください")
            TextEditor(text: $input)
                .frame(width : 300.0, height : 200.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.blue, lineWidth: 1)
                )
                .autocorrectionDisabled()
                .onSubmit() {
                    print("return")
                }
            Spacer()
            Button("送信") {
                postData()
            }
        }
        .padding()
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
