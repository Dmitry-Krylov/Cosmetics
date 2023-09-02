//
//  SecondView.swift
//  Cosmetics
//
//  Created by Елена Крылова on 14.08.2023.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                Text("Welcom ....")
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
