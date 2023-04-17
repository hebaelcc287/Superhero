//
//  ContentView.swift
//  Super
//
//  Created by Heba Elcc on 17.4.2023.
//
import SwiftUI

struct ContentView: View {
    
    var superheros: [Superhero] = superherosData
    var body: some View {
     
        ScrollView(.horizontal){
            HStack {
                ForEach(superheros) { item in
                    SuperheroView(superH: item)
                }
               
            }//:HStack
            .padding(20)

        }
        
        
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
