//
//  Hero.swift
//  SuperKahramanSwiftUI
//
//  Created by Yusuf Ziya YILDIRIM on 28.04.2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Hero: Identifiable {
    var id = UUID()
    var isim : String
    var gercekIsim : String
    var gorselIsmi : String
    var sehir : String
    var meslek : String
    var koordinat : Coordinate
    
    var kordinatLokasyonu : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: koordinat.latitude, longitude: koordinat.longitude)
    }
}


struct Coordinate {
    var latitude : Double
    var longitude : Double
}

let batman = Hero(isim: "Batman", gercekIsim: "Bruce Wayne", gorselIsmi: "batman", sehir: "Gotham", meslek: "İş Adamı", koordinat: Coordinate(latitude: 41.8713679, longitude: -87.7669902))

let superman = Hero(isim: "Superman", gercekIsim: "Clark Kent", gorselIsmi: "superman", sehir: "Kansas", meslek: "Gazeteci", koordinat: Coordinate(latitude: 39.0865207, longitude: -94.7089592))

let spiderman = Hero(isim: "Spiderman", gercekIsim: "Peter Parker", gorselIsmi: "spiderman", sehir: "New York", meslek: "Fotoğrafçı", koordinat: Coordinate(latitude: 40.7160119, longitude: -74.0524729))

let ironman = Hero(isim: "Ironman", gercekIsim: "Tony Stark", gorselIsmi: "ironman", sehir: "Los Angeles", meslek: "İş Adamı", koordinat: Coordinate(latitude: 33.8003309, longitude: -118.2261494))

let heroArray = [batman, superman, spiderman, ironman]
