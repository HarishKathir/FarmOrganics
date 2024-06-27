//
//  EmptyButton.swift
//  FOF
//
//  Created by Harishkathir on 19/08/23.
//

import SwiftUI

struct EmptyButton: View {
    @EnvironmentObject var cartManager : CartManager
    var body: some View {
        Button{
            cartManager.emptycart()
        }label: {
            HStack{
                Text("Empty Cart")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width-32 ,height: 48)
        }
        .background(Color(.systemRed))
        .cornerRadius(10)
        .padding(.top , 24)
    }
}

struct EmptyButton_Previews: PreviewProvider {
    static var previews: some View {
        EmptyButton()
            .environmentObject(CartManager())
    }
}
