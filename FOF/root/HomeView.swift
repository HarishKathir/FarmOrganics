//
//  HomeView.swift
//  FOF
//
//  Created by Harishkathir on 19/08/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @EnvironmentObject var cartmanager  : CartManager
    var body: some View {
        if let user = viewModel.currentUser{
            NavigationStack {
                ZStack(alignment: .top){
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        NavigationStack {
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("Hi,")
                                        .font(.system(size: 24))
                                        .padding(.top,4)
                                
                                    Text(user.fullname)
                                        .font(.system(size: 24))
                                        .padding(.top,4)
                                        .foregroundColor(Color("Orange"))
                                    
                                    Spacer()
                                    
                                    NavigationLink {
                                        SettingsView()
                                    } label: {
                                        Image(systemName: "gearshape")
                                            .font(.system(size: 20))
                                            .foregroundColor(.black)
                                    }

            
                                }
                                Divider()
                                
                                Text("Find the \nMost Organic Products")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(Color("LightGreen"))
                            }
                        }
                        .padding()
                        
                        
                        ImageSliderView()
                        
                        Divider()
                            .padding()
                        
                        HStack{
                            Text("Products")
                                .font(.title)
                                .fontWeight(.medium)
                                .bold()
                                .foregroundColor(Color("LightGreen"))
                            
                            Spacer()
                            
                            NavigationLink {
                                CategoriesView()
                            } label: {
                                Image(systemName: "square.grid.2x2.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("DarkGreen"))
                            }

                            
                        }
                        .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 10){
                                ForEach(productList, id: \.id){product in
                                    NavigationLink {
                                        ProductDetails(product: product)
                                    } label: {
                                        DisplayCard(product: product)
                                    }

                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CartManager())
    }
}
