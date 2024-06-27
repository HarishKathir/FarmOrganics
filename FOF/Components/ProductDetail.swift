//
//  ProductDetail.swift
//  FOF
//
//  Created by Harishkathir on 19/08/23.
//

import SwiftUI

struct ProductDetails: View {
    var product : Product
    var body: some View {
        ScrollView{
            ZStack{
                Color(.white)
                
                VStack(alignment: .leading){
                    ZStack(alignment: .topTrailing){
                        Image(product.image)
                            .resizable()
                            .ignoresSafeArea(edges:.top)
                            .frame(height: 300)
                            .cornerRadius(20)
                        
                        
                    }
                    
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(product.name)
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color("DarkGreen"))
                            
                            Spacer()
                            
                            Text("Rs.\(product.price).00")
                                .font(.title2)
                                .fontWeight(.medium)
                                .padding(.horizontal)
                        }
                        .padding(.vertical)
                        VStack(alignment: .leading){
                            Text("Product detail")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Orange"))
                            Divider()
                            
                            Spacer()
                            
                            Text(product.description)

                        }
                    }
                    
                }
            }
        }
//        .ignoresSafeArea(edges:.top)
        .padding()
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: productList[4])
    }
}
