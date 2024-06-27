//
//  SettingsView.swift
//  FOF
//
//  Created by Harishkathir on 18/08/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Biscuit"))
                            .frame(width:72 ,height: 72)
                            .background(Color("DarkGreen"))
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                        }
                    }
                }
                Section("General"){
                    HStack{
                        SettingRowView(imageName: "gear",
                                       title: "Version",
                                       tintcolor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Section("Account"){
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill",
                                       title: "SignOut",
                                       tintcolor: .red)
                        
                    }
                    
                    Button {
                        viewModel.deleteAccount()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill",
                                       title: "Delete",
                                       tintcolor: .red)
                        
                    }

                }
            }
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
