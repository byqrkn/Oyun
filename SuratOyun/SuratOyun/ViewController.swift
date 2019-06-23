//
//  ViewController.swift
//  SuratOyun
//
//  Created by ByG on 23.06.2019.
//  Copyright © 2019 ByG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highSocre: UILabel!
    @IBOutlet weak var surat1: UIImageView!
    @IBOutlet weak var surat2: UIImageView!
    @IBOutlet weak var surat3: UIImageView!
    @IBOutlet weak var surat4: UIImageView!
    @IBOutlet weak var surat5: UIImageView!
    @IBOutlet weak var surat6: UIImageView!
    @IBOutlet weak var surat7: UIImageView!
    @IBOutlet weak var surat8: UIImageView!
    @IBOutlet weak var surat9: UIImageView!
    
    
    
    var time = Timer ()
    var count = 30
    var score = 0
    var suratArry = [UIImageView] ()
    var hideTime = Timer ()
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        if highScore == nil {
            highSocre.text = "Rank: "
            
        }
        if let newScore = highScore as? Int {
            highSocre.text = String(newScore)
            
            
        }
        
        
        let defaults = UserDefaults.standard
        
        // 1- UITapGestureRecognizer TANIMLAMA
        let recognizer1 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
        let recognizer2 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
        let recognizer3 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
        let recognizer4 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
        let recognizer5 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
        let recognizer6 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
        let recognizer7 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
        let recognizer8 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
        let recognizer9 = UITapGestureRecognizer.init(target: self, action: #selector(artanscore))
       
        // 2- Resime Tıklandığında Etkileşim
        surat1.isUserInteractionEnabled = true
        surat2.isUserInteractionEnabled = true
        surat3.isUserInteractionEnabled = true
        surat4.isUserInteractionEnabled = true
        surat5.isUserInteractionEnabled = true
        surat6.isUserInteractionEnabled = true
        surat7.isUserInteractionEnabled = true
        surat8.isUserInteractionEnabled = true
        surat9.isUserInteractionEnabled = true
        
       
        
        surat1.addGestureRecognizer(recognizer1)
        surat2.addGestureRecognizer(recognizer2)
        surat3.addGestureRecognizer(recognizer3)
        surat4.addGestureRecognizer(recognizer4)
        surat5.addGestureRecognizer(recognizer5)
        surat6.addGestureRecognizer(recognizer6)
        surat7.addGestureRecognizer(recognizer7)
        surat8.addGestureRecognizer(recognizer8)
        surat9.addGestureRecognizer(recognizer9)
        
         // 3- dizi oluşturma
        
        suratArry.append(surat1)
        suratArry.append(surat2)
        suratArry.append(surat3)
        suratArry.append(surat4)
        suratArry.append(surat5)
        suratArry.append(surat6)
        suratArry.append(surat7)
        suratArry.append(surat8)
        suratArry.append(surat9)
        
        
        
    
        
        
        
        
     
        func hiddensurat() {
            for surat in suratArry {
                surat.isHidden = true
            }
            let random = Int(arc4random_uniform(UInt32(suratArry.count - 1)))
            suratArry[random].isHidden = false
        
        }
        hiddensurat()
        
        time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hiddensurat1), userInfo: nil, repeats: true)
        
        
        hideTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timefunc) , userInfo: nil, repeats: true)
        
        
        
    }
    
    @ objc func timefunc () {
        timeLabel.text = String(count)
        count = count - 1
        
        if count == 0 {
           time.invalidate()
            hideTime.invalidate()
            
            if self.score > Int(highSocre.text!)!
            {
                
                UserDefaults.standard.set(self.score, forKey: "highscore")
                highSocre.text = String(self.score)
                
              
                
            }
        
            let Alert = UIAlertController.init(title: "Opps !", message: "Time Out! Do you want to Contiounue ?", preferredStyle: .alert)
            let okButton = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            let ReplayButton = UIAlertAction.init(title: "Replay", style: .default, handler: {(UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.count = 30
                self.timeLabel.text = "\(self.count)"
                
                self.time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timefunc), userInfo: nil, repeats: true)
                self.hideTime = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hiddensurat1), userInfo: nil, repeats: true)
                
                
                
            })
            
            
            Alert.addAction(ReplayButton)
            Alert.addAction(okButton)
            self.present(Alert, animated: true, completion: nil)
        }
        
    
    }
    @objc func artanscore () {
        scoreLabel.text = "Score: \(score) "
        score = score + 1
        
    }
    
    @objc func hiddensurat1 () {
        for surat in suratArry {
            surat.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(suratArry.count - 1)))
        suratArry[random].isHidden = false
        
        
    }
    
    
    }



