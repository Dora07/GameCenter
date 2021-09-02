
import UIKit
import AVFoundation
class MetronomeViewController: UIViewController
{

    @IBOutlet weak var BeatLabel: UILabel!
    
    @IBOutlet weak var PlayButton: UIButton!
    
    
    @IBOutlet weak var TempleSlowly: UIButton!
    @IBOutlet weak var TempleQuickly: UIButton!
    
    @IBOutlet weak var TempleSlider: UISlider!
    
    var SelectedSpeed:Float = 40.0
    
    var AudioPlayer1 = AVAudioPlayer()
    var IsPlaying = false
    
    var Timer1 : Timer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        TempleQuickly.setBackgroundImage(UIImage(named:"40-100(+)"), for: .normal)
        TempleSlowly.setBackgroundImage(UIImage(named:"40-100(-)"), for: .normal)
        PlayButton.setBackgroundImage(UIImage(named: "40-100(play)"), for: .normal)
        
        //音樂播放
        let url : NSURL = Bundle.main.url(forResource: "temple", withExtension: "mp3")! as NSURL; do {
            AudioPlayer1 = try AVAudioPlayer(contentsOf: url as URL, fileTypeHint: nil)} catch let error as NSError{ print(error.description)
        }
        
        
    }
    

    @IBAction func SliderAnction(_ sender: UISlider)
    {
        SelectedSpeed = sender.value
        BeatLabel.text = String(format: "%.0f",Double(SelectedSpeed))
        
        
    }
    
    
    @IBAction func QuicklyAction(_ sender: UIButton)
    {
      
        TempleSlider.value += 1
        BeatLabel.text = String(format: "%.0f",Double(TempleSlider.value))
       
        if  TempleSlider.value <= 100
        {
            TempleQuickly.setBackgroundImage(UIImage(named:"40-100(+)"), for: .normal)
            TempleSlowly.setBackgroundImage(UIImage(named:"40-100(-)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"40-100(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemPurple
        }
        else if TempleSlider.value <= 170
        {
            TempleQuickly.setBackgroundImage(UIImage(named:"101-170(+)"), for: .normal)
            TempleSlowly.setBackgroundImage(UIImage(named:"101-170(-)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"101-170(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemBlue
        }else
        {
            TempleQuickly.setBackgroundImage(UIImage(named:"171-218(+)"), for: .normal)
            TempleSlowly.setBackgroundImage(UIImage(named:"171-218(-)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"171-218(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemRed
        }
}
   
    
    @IBAction func SlowlyAction(_ sender: UIButton)
    {
        TempleSlider.value -= 1
        BeatLabel.text = String(format: "%.0f",Double(TempleSlider.value))
        
        if  TempleSlider.value <= 100
        {
            TempleSlowly.setBackgroundImage(UIImage(named:"40-100(-)"), for: .normal)
            TempleQuickly.setBackgroundImage(UIImage(named:"40-100(+)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"40-100(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemPurple
        }
        else if TempleSlider.value <= 170
        {
            TempleSlowly.setBackgroundImage(UIImage(named:"101-170(-)"), for: .normal)
            TempleQuickly.setBackgroundImage(UIImage(named:"101-170(+)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"101-170(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemBlue
        }else
        {
        TempleSlowly.setBackgroundImage(UIImage(named:"171-218(-)"), for: .normal)
            TempleQuickly.setBackgroundImage(UIImage(named:"171-218(+)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"171-218(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemRed
        }
    }
    
    @objc func RepeatPlay()
    {
        AudioPlayer1.play()
    }
    
    
    

    @IBAction func PlayButtonAction(_ sender: UIButton)
    {
        if IsPlaying
        {
            IsPlaying = false
            Timer1.invalidate()
        }else
        {
            IsPlaying = true
            Timer1 = Timer.scheduledTimer(timeInterval: 60/Double(SelectedSpeed), target: self ,selector: #selector(MetronomeViewController.RepeatPlay),userInfo: nil,repeats: true)
        }
        if  TempleSlider.value <= 100
        {
            TempleSlowly.setBackgroundImage(UIImage(named:"40-100(-)"), for: .normal)
            TempleQuickly.setBackgroundImage(UIImage(named:"40-100(+)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"40-100(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemPurple
        }
        else if TempleSlider.value <= 170
        {
            TempleSlowly.setBackgroundImage(UIImage(named:"101-170(-)"), for: .normal)
            TempleQuickly.setBackgroundImage(UIImage(named:"101-170(+)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"101-170(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemBlue
        }else
        {
        TempleSlowly.setBackgroundImage(UIImage(named:"171-218(-)"), for: .normal)
            TempleQuickly.setBackgroundImage(UIImage(named:"171-218(+)"), for: .normal)
            PlayButton.setBackgroundImage(UIImage(named:"171-218(play)"), for: .normal)
            TempleSlider.thumbTintColor = UIColor.systemRed
        }
        
    }
    
    
    
    
    
}
