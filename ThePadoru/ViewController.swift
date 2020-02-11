//
//  ViewController.swift
//  ThePadoru
//
//  Created by Seçkin Denli on 11.02.2020.
//  Copyright © 2020 Seçkin Denli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var padoruImage1: UIImageView!
    @IBOutlet weak var padoruImage2: UIImageView!
    @IBOutlet weak var padoruImage3: UIImageView!
    @IBOutlet weak var padoruImage4: UIImageView!
    @IBOutlet weak var padoruImage5: UIImageView!
    @IBOutlet weak var padoruImage6: UIImageView!
    @IBOutlet weak var padoruImage7: UIImageView!
    @IBOutlet weak var padoruImage8: UIImageView!
    @IBOutlet weak var padoruImage9: UIImageView!
    var padoruArray = [UIImageView]()
    var score = 0
    var counter = 30
    var timer = Timer()
    var hidTimer = Timer()
    var highS = 0
    
    
    
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        timeLabel.text = String(counter)
        let storedScore = UserDefaults.standard.object(forKey: "hs")
        highscoreLabel.text = storedScore as? String
        
        scoreLabel.text = "Score : \(score)"
        padoruImage1.isUserInteractionEnabled = true
        padoruImage2.isUserInteractionEnabled = true
        padoruImage3.isUserInteractionEnabled = true
        padoruImage4.isUserInteractionEnabled = true
        padoruImage5.isUserInteractionEnabled = true
        padoruImage6.isUserInteractionEnabled = true
        padoruImage7.isUserInteractionEnabled = true
        padoruImage8.isUserInteractionEnabled = true
        padoruImage9.isUserInteractionEnabled = true
        
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(scoreInc))
       
        padoruImage1.addGestureRecognizer(gestureRecognizer1)
        padoruImage2.addGestureRecognizer(gestureRecognizer2)
        padoruImage3.addGestureRecognizer(gestureRecognizer3)
        padoruImage4.addGestureRecognizer(gestureRecognizer4)
        padoruImage5.addGestureRecognizer(gestureRecognizer5)
        padoruImage6.addGestureRecognizer(gestureRecognizer6)
        padoruImage7.addGestureRecognizer(gestureRecognizer7)
        padoruImage8.addGestureRecognizer(gestureRecognizer8)
        padoruImage9.addGestureRecognizer(gestureRecognizer9)
   
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hidTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hiddenPadoru), userInfo: nil, repeats: true)
    
        padoruArray = [padoruImage1, padoruImage2, padoruImage3, padoruImage4, padoruImage5, padoruImage6, padoruImage7, padoruImage8, padoruImage9]
    
        
    
    }
    
    
    
    @objc func hiddenPadoru () {for hidPad in padoruArray {
        
        
        hidPad.isHidden = true
        }
       let random = Int(arc4random_uniform(UInt32(padoruArray.count - 1) ))
        padoruArray[random].isHidden = false
        
    }
    

    
    @objc func scoreInc (){
        
        score += 1
        scoreLabel.text = "Score : \(score)"
        
        
        
        
    }
    @objc func countDown (){
        counter -= 1
        timeLabel.text = String(counter)
       
        if (counter == -0 ){
            
            timer.invalidate()
            hidTimer.invalidate()
            for hidPad in padoruArray {
            hidPad.isHidden = true
                                      }
           
            let alert = UIAlertController(title: "Time's up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okBut = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
            let rePlay = UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                self.counter = 30
                self.timeLabel.text = String(self.counter)
                self.score = 0
                self.scoreLabel.text = "Score : \(self.score)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hidTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hiddenPadoru), userInfo: nil, repeats: true)
                
            }
                alert.addAction(okBut)
                alert.addAction(rePlay)
            
            self.present(alert, animated: true  )
            
            if score > highS { highS = score
                highscoreLabel.text = "Highscore : \(highS)"
                UserDefaults.standard.set(highscoreLabel.text, forKey: "hs")
                UserDefaults.standard.synchronize()
            }
            }
            
        }
        
        
        
        
    }
            
        
        
    
    
        
    
    



