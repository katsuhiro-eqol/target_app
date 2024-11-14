//
//  SignUp.swift
//  TargetApp
//
//  Created by Apple on 2024/11/14.
//

import SwiftUI

struct SignUp: View {
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var resetPassword:String = ""
    let bgColor = Color.init(red: 0.92, green: 0.93, blue: 0.94)
    var body: some View {
        Text("ユーザー登録してください")
            .font(.title)
            .padding(.vertical, 20)
        VStack{
            Text("email")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField(text: $email, prompt: Text("Required")) {
                Text(email)
            }
            .frame(width : width*0.85, height : height*0.07)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                .stroke(Color.blue, lineWidth: 1)
            )
            Text("password")
                .frame(maxWidth: .infinity, alignment: .leading)
            SecureField(text: $password, prompt: Text("Required")) {
                Text(password)
            }
            .frame(width : width*0.85, height : height*0.07)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                .stroke(Color.blue, lineWidth: 1)
            )
            Text("password再入力")
                .frame(maxWidth: .infinity, alignment: .leading)
            SecureField(text: $resetPassword, prompt: Text("Required")) {
                Text(resetPassword)
            }
            .frame(width : width*0.85, height : height*0.07)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                .stroke(Color.blue, lineWidth: 1)
            )
        }
        .frame(width : width*0.85, height : height*0.4)
        Button(action: {
            print("button tapped")
        }){
            Text("新規登録")
                .font(.system(size: 25, weight: .semibold, design: .rounded))
                .foregroundColor(.gray)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(bgColor)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.gray, lineWidth: 0)
                )
        }
        .padding(.vertical, 20)
        Spacer()
        Button("ログイン画面に戻る") {
            //
        }
        .padding(.vertical, 30)
    }
}

#Preview {
    SignUp()
}
