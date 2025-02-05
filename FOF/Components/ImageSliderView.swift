//
//  ImageSliderView.swift
//  FOF
//
//  Created by Harishkathir on 19/08/23.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides : [String] = ["Honey","RedChilli","Turmeric","CoconutOil","OliveOil","Sugar"]
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            ZStack(alignment: .trailing){
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity,height: 180)
                    .scaledToFit()
                    .cornerRadius(15)
            }
            HStack{
                ForEach(0..<5){index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("DarkGreen") : Color("LightGreen"))
                        .frame(width: 10 , height: 10)
                }
            }
            .padding()
        }
        .padding()
        .onAppear{Timer.scheduledTimer(withTimeInterval: 5, repeats: true){timer in
            if self.currentIndex + 1 == self.slides.count{
                self.currentIndex = 0
            }else{
                self.currentIndex += 1
                }
            }
    }
}
    
    struct ImageSliderView_Previews: PreviewProvider {
        static var previews: some View {
            ImageSliderView()
        }
    }
}
