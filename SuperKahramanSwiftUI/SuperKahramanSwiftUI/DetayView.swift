//
//  DetayView.swift
//  SuperKahramanSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 28.04.2023.
//

import SwiftUI

struct DetayView: View {
    var secilenHero : Hero
    
    var body: some View {
        VStack {
            MapView(coordinate: secilenHero.kordinatLokasyonu)
                .frame(height: UIScreen.main.bounds.height * 0.3)
                .edgesIgnoringSafeArea(.top)
                
            OzelGorselView(image: Image(secilenHero.gorselIsmi))
                .frame(width: UIScreen.main.bounds.width * 0.9)
                .offset(y: UIScreen.main.bounds.height *  -0.25)
            
            VStack {
                
                VStack{
                    Text(secilenHero.isim)
                        .foregroundColor(.brown)
                        .padding(.vertical)
                    Text(secilenHero.gercekIsim)
                        .foregroundColor(.blue)
                }.font(.largeTitle)
                   
                VStack{
                    Text(secilenHero.sehir)
                        .padding(.vertical)
                    Text(secilenHero.meslek)
                }.bold()
                    .font(.title)
                    .foregroundColor(.indigo)
                
                Spacer()
                
            }.offset(y: UIScreen.main.bounds.height * -0.23)
        }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(secilenHero: heroArray[0])
    }
}
