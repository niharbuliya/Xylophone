//
//  ViewController.swift
//  Xylophone
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickOfKey(_ sender: UIButton) {
        playSound(keyName: sender.currentTitle!)
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
    }
    
    func playSound(keyName: String){
        let url = Bundle.main.url(forResource: keyName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

