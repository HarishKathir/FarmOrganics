//
//  SignUpView.swift
//  FOF
//
//  Created by Harishkathir on 18/08/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State var visible = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            //Logo
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120 , height: 120)
                .padding(.vertical,32)
            
            //LoginTitle
            Text("Sign in to your Account")
                .font(.system(size : 32))
                .fontWeight(.bold)
                .foregroundColor(Color("DarkGreen"))
            
            //InputFields
            VStack(spacing: 24){
                HStack {
                    Image(systemName: "person")
                    TextField("Your name" , text: self.$fullname)
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.black),lineWidth : 2))
                .padding(.top , 25)
                
                HStack {
                    Image(systemName: "mail")
                    TextField("Email",text : self.$email)
                        
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.black),lineWidth : 2))
                .padding(.top , 25)
                .autocapitalization(.none)
                
                
                HStack(spacing: 15){
                    Image(systemName: "lock.fill")
                    VStack{
                        if self.visible{
                            TextField("Password" , text: self.$password)
                            
                        }else{
                            SecureField("Password" , text: self.$password)
                        }
                    }
                    
                    //eye button
                    
                    Button {
                        
                        self.visible.toggle()
                        
                    } label: {
                        Image(systemName : self.visible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(Color(.black))
                    }
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.black),lineWidth : 2))
                .padding(.top , 25)
               
                
            }
            .padding(.horizontal ,20)
            .padding(.top ,20)
            
            
            //SignInButton
            Button{
                Task{
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullname: fullname)
                }
            }label: {
                HStack{
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width-32 ,height: 48)
            }
            .background(Color("Orange"))
            .cornerRadius(10)
            .padding(.top , 24)
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                Button {
                    dismiss()
                } label: {
                    Text("LogIn")
                        .foregroundColor(Color("DarkGreen"))
                        .bold()
                }
            }
            .foregroundColor(.black)

        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
