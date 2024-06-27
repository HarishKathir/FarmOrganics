//
//  DisplayCard.swift
//  FOF
//
//  Created by Harishkathir on 19/08/23.
//

import SwiftUI

struct DisplayCard: View {
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
            
        }
        
    }
    
    struct DisplayCard_Previews: PreviewProvider {
        static var previews: some View {
            DisplayCard(product: productList[2])
        }
    }
}
