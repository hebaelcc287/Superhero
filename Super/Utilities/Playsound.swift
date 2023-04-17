//
//  Playsound.swift
//  Super
//
//  Created by Heba Elcc on 17.4.2023.
//


import Foundation
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playsound(sound : String , type : String){
    
    if let path = Bundle.main.path(forResource:  sound, ofType: type){
        do {  audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            audioPlayer?.play()

        }
        catch{
            print("couldn't find the file")
        }
    }
}
