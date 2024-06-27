//
//  ProductCard.swift
//  FOF
//
//  Created by Harishkathir on 19/08/23.
//

import SwiftUI


struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                        .foregroundColor(Color("Biscuit"))
                    
                    Text("Rs.\(product.price)")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(Color("LightGreen").opacity(0.8))
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(Color("Orange"))
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
