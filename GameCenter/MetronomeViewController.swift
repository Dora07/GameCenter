
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
    var AudioPlayer = AVAudioPlayer()
    var IsPlaying = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        TempleQuickly.setBackgroundImage(UIImage(named:"40-100(+)"), for: .normal)
        TempleSlowly.setBackgroundImage(UIImage(named:"40-100(-)"), for: .normal)
        let url : NSURL = Bundle.main.url(forResource: "temple", withExtension: "mp3")! as NSURL; do {
            AudioPlayer = try AVAudioPlayer(contentsOf: url as URL, fileTypeHint: nil)} catch let error as NSError{ print(error.description)
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
            
        }
        else if TempleSlider.value <= 170
        {
            TempleQuickly.setBackgroundImage(UIImage(named:"101-170(+)"), for: .normal)
        }else
        {
            TempleQuickly.setBackgroundImage(UIImage(named:"171-218(+)"), for: .normal)
        }
}
   
    
    @IBAction func SlowlyAction(_ sender: UIButton)
    {
        TempleSlider.value -= 1
        BeatLabel.text = String(format: "%.0f",Double(TempleSlider.value))
        
        if  TempleSlider.value <= 100
        {
            TempleSlowly.setBackgroundImage(UIImage(named:"40-100(-)"), for: .normal)
            
        }
        else if TempleSlider.value <= 170
        {
            TempleSlowly.setBackgroundImage(UIImage(named:"101-170(-)"), for: .normal)
        }else
        {
        TempleSlowly.setBackgroundImage(UIImage(named:"171-218(-)"), for: .normal)
        }
    }
    

    @IBAction func PlayButtonAction(_ sender: UIButton)
    {
        AudioPlayer.play()
        
        
    }
    
    
    
    
    
}
