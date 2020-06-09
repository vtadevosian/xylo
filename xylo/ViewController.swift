//
//  ViewController.swift
//  xylo
//
//  Created by Vahram Tadevosian on 6/9/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let unhighlightedKeyColors = [#colorLiteral(red: 1, green: 0.2941176471, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.6705882353, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9001885056, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 1, blue: 0.4442569613, alpha: 1), #colorLiteral(red: 0, green: 1, blue: 0.9613726735, alpha: 1), #colorLiteral(red: 0, green: 0.576669395, blue: 1, alpha: 1), #colorLiteral(red: 0.5466651917, green: 0, blue: 1, alpha: 1)]
    let highlightedKeyColors = [#colorLiteral(red: 0.7907230258, green: 0.2318771482, blue: 0.03286046535, alpha: 1), #colorLiteral(red: 0.8281216025, green: 0.5575735569, blue: 0.05037004501, alpha: 1), #colorLiteral(red: 0.8195382953, green: 0.7401053905, blue: 0.05982712656, alpha: 1), #colorLiteral(red: 0.04548472166, green: 0.7471590638, blue: 0.05141060054, alpha: 1), #colorLiteral(red: 0.07161668688, green: 0.6606044173, blue: 0.2965246439, alpha: 1), #colorLiteral(red: 0.03887887299, green: 0.6973400116, blue: 0.6706439257, alpha: 1), #colorLiteral(red: 0.02827665024, green: 0.4195930958, blue: 0.7308012843, alpha: 1), #colorLiteral(red: 0.3569839597, green: 0.01296158601, blue: 0.6559349895, alpha: 1)]

    @IBOutlet var keyButtons: [XyloKeyButton]!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpKeyColors()
    }
    
    @IBAction func keyButtonTapped(_ sender: XyloKeyButton) {
        if let note = sender.currentTitle {
            playNote(note)
        }
    }
    
    private func setUpKeyColors() {
        for i in 0..<8 {
            keyButtons[i].unhighlightedBGColor = unhighlightedKeyColors[i]
            keyButtons[i].highlightedBGColor = highlightedKeyColors[i]
        }
    }
    
    private func playNote(_ note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print("ERROR WHEN TRYING TO PLAY A SOUND:", error.localizedDescription)
        }
    }
}


