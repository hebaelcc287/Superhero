//
//  SuperheroView.swift
//  Super
//
//  Created by Heba Elcc on 17.4.2023.
//


import SwiftUI

struct SuperheroView: View {
    var superH : Superhero
    @State var isScaling : Bool = false
    @State var isSliding : Bool = false
    @State var isAlertPresented: Bool = false
    //    var gradient : [Color] = [Color("ColorHulk01"),Color("ColorHulk02")]
    
    var body: some View {
        ZStack{
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.7)
                .animation(.easeOut(duration: 0.8), value: isScaling)
            
            VStack{
                Text(superH.title )
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                
                Button {
                    //some actions
                    isAlertPresented.toggle()
                    playsound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack{
                        Text("Start")
                        Image(systemName: "arrow.right.circle")
                    }//: HStack
                    .padding()
                    .font(.title2)
                    .background(LinearGradient(colors: superH.gradientColors, startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isAlertPresented) {
                        Alert(title: Text("More about \(superH.title)") , message: Text(superH.message) , dismissButton: .default(Text("Ok")))
                        
                    }
                }//:Label
                
            }//: VStack
            .offset(y: isSliding ? 150 : 300)
            .animation(.easeOut(duration: 3), value: isSliding)
            
        }//: ZStack
        .frame(width: 335 ,height: 545 ,alignment: .center )
        .background(LinearGradient(colors: superH.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color: .black, radius: 2)
        .onAppear {
            isScaling = true
            isSliding = true
        }
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView(superH: superherosData[1])
    }
}
