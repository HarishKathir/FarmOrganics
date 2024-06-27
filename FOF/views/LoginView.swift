//
//  LoginView.swift
//  FOF
//
//  Created by Harishkathir on 18/08/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State var visible = false
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                //Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120 , height: 120)
                    .padding(.vertical,32)
                
                //LoginTitle
                Text("Login to your Account")
                    .font(.system(size : 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkGreen"))
                
                //InputFields
                VStack(spacing: 24){
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
                    
//                    HStack{
//                        Spacer()
//
//                        Button {
//
//                        } label: {
//                            Text("Forget passwrod ?")
//                                .fontWeight(.bold)
//                                .foregroundColor(Color(.black))
//                        }
//
//                    }
                }
                .padding(.horizontal ,20)
                .padding(.top ,20)
                
                
                
                //LoginButton
                Button{
                    Task{
                        try await viewModel.signIn(withEmail: email,password:password)
                    }
                }label: {
                    HStack{
                        Text("Login")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width-32 ,height: 48)
                }
                .background(Color("Orange"))
                .cornerRadius(10)
                .padding(.top , 24)
   
                Spacer()
                
                //SignUp Page - Link
                HStack {
                    Text("Don't have an account?")
                    NavigationLink {
                        SignUpView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                            Text("Sign Up")
                        .foregroundColor(Color("DarkGreen"))
                        .bold()
                    }

                }
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
