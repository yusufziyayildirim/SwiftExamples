//
//  ListeView.swift
//  SuperKahramanSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 28.04.2023.
//

import SwiftUI

struct ListeView: View {
    var body: some View {
        NavigationView {
            List(heroArray) { hero in
                
                NavigationLink(destination: DetayView(secilenHero: hero)) {
                    ListeRowView(hero: hero)
                }
            }.navigationTitle("Süper Kahramanlar")
        }
    }
}

struct ListeView_Previews: PreviewProvider {
    static var previews: some View {
        ListeView()
    }
}
