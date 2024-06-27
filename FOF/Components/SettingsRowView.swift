//
//  SettingsRowView.swift
//  FOF
//
//  Created by Harishkathir on 18/08/23.
//

import SwiftUI


struct SettingRowView: View {
    let imageName : String
    let title : String
    let tintcolor : Color
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintcolor)
            
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(imageName: "gear",
                       title: "Version",
                       tintcolor: Color(.systemGray))
    }
}
