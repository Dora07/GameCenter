//
//  InfoView.swift
//  GameCenter
//
//  Created by 謝孟芩 on 2021/7/23.
//

import UIKit

class InfoView: UIView
{
    @IBOutlet weak var TextLabel: UILabel!

    
    func Show(text:String)
    {
        TextLabel.text = text
        
        //將InfoView擺在前面不被擋到
        superview?.bringSubviewToFront(self)
        let Animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn)
        {
        self.center = self.superview!.center
        }
        Animator.startAnimation()
    }
    
    func Close()
    {
        let Avimator = UIViewPropertyAnimator(duration: 1, curve:.easeIn )
        {
            self.frame.origin.y = self.superview!.frame.maxY
        }
        Avimator.addCompletion{ (_) in
            self.frame.origin.y = -self.superview!.frame.maxY
        }
        Avimator.startAnimation()
    }
    //info邊線
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.borderWidth = 7
        layer.borderColor = UIColor.white.cgColor
    }
    
}
