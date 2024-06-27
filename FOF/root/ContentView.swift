//
//  ContentView.swift
//  FOF
//
//  Created by Harishkathir on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                HomeView()
            }else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct TabBarView: View{
//    @EnvironmentObject var viewModel: AuthViewModel
//    @State var currentTab = 1
//    var body: some View{
//        ZStack(alignment: .bottom) {
//            TabView(selection: $currentTab){
//                HomeView()
//                    .tag("1")
//                    .tabItem {
//                        Image(systemName: "house")
//                    }
//                
//                CategoriesView()
//                    .tag("w")
//                    .tabItem {
//                        Image(systemName: "square.grid.2x2.fill")
//                    }
//                
//                SettingsView()
//                    .tag("3")
//                    .tabItem {
//                        Image(systemName: "gearshape")
//                    }
//            }
//        }
//    }
//}
