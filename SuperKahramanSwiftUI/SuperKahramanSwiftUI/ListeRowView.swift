//
//  ListeRowView.swift
//  SuperKahramanSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 28.04.2023.
//

import SwiftUI

struct ListeRowView: View {
    var hero : Hero
    var body: some View {
        HStack{
            Image(hero.gorselIsmi)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .clipShape(Circle())
            VStack{
                Text(hero.isim)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(hero.gercekIsim)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct ListeRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListeRowView(hero: batman)
    }
}
