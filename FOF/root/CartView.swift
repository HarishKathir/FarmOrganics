//
//  CartView.swift
//  FOF
//
//  Created by Harishkathir on 19/08/23.
//

import SwiftUI
import AlertKit

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    ProductRow(product: product)
                }
                
                HStack {
                    Text("Your cart total is")
                    Spacer()
                    Text("Rs.\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                EmptyButton()
                
            } else {
                Text("Your cart is empty.")
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
