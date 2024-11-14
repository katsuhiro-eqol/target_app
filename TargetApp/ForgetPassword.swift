//
//  ForgetPassword.swift
//  TargetApp
//
//  Created by Apple on 2024/11/14.
//

import SwiftUI

struct ForgetPassword: View {
    @State private var email:String = ""
    let bgColor = Color.init(red: 0.92, green: 0.93, blue: 0.94)
    var body: some View {
        Text("パスワードリセット")
            .font(.title)
            .padding(.vertical, 20)
        VStack{
            Text("登録済みのemailアドレスを入力")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField(text: $email, prompt: Text("Required")) {
                Text(email)
            }
            .frame(width : width*0.85, height : height*0.07)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                .stroke(Color.blue, lineWidth: 1)
            )
        }
        .frame(width : width*0.85, height : height*0.4)
        Text("パスワードリセットのメールを送信します")
        Button(action: {
            print("button tapped")
        }){
            Text("パスワードリセット")
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
        Spacer()
        Button("ログイン画面に戻る") {
            //
        }
        .padding(.vertical, 30)
    }}

#Preview {
    ForgetPassword()
}
