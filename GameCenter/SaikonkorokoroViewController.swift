
import UIKit
import AVFoundation

class SaikonkorokoroViewController: UIViewController
{
    
    //骰子數量
    @IBOutlet weak var DiceAmountLabel: UILabel!
    //骰子圖片1-6
    @IBOutlet weak var DiceImage1: UIImageView!
    @IBOutlet weak var DiceImage2: UIImageView!
    @IBOutlet weak var DiceImage3: UIImageView!
    @IBOutlet weak var DiceImage4: UIImageView!
    @IBOutlet weak var DiceImage5: UIImageView!
    @IBOutlet weak var DiceImage6: UIImageView!
    //骰子總數
    @IBOutlet weak var DiceTotalLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        DiceTotalLabel.text = "00"
        DiceAmountLabel.text = "0"
      
      
    }
    
  
    
    @IBAction func RollDiceAction(_ sender: UIButton)
    {
        
        let DiceImage : [UIImage?] = [UIImage(named: "dice01"),UIImage(named: "dice02"),UIImage(named: "dice03"),UIImage(named: "dice04"),UIImage(named: "dice05"),UIImage(named: "dice06")]
       
        let DiceNumber1 = Int.random(in: 0...5)
        DiceImage1.image = DiceImage[DiceNumber1]
       
        let DiceNumber2 = Int.random(in: 0...5)
        DiceImage2.image = DiceImage[DiceNumber2]
        let DiceNumber3 = Int.random(in: 0...5)
        DiceImage3.image = DiceImage[DiceNumber3]
        let DiceNumber4 = Int.random(in: 0...5)
        DiceImage4.image = DiceImage[DiceNumber4]
        let DiceNumber5 = Int.random(in: 0...5)
        DiceImage5.image = DiceImage[DiceNumber5]
        let DiceNumber6 = Int.random(in: 0...5)
        DiceImage6.image = DiceImage[DiceNumber6]
        
        if DiceImage2.isHidden == true , DiceImage3.isHidden == true , DiceImage4.isHidden == true , DiceImage5.isHidden == true ,DiceImage6.isHidden == true
        {     
            DiceTotalLabel.text = String(DiceNumber1 + 1)
        }else
        if  DiceImage3.isHidden == true , DiceImage4.isHidden == true , DiceImage5.isHidden == true ,DiceImage6.isHidden == true
        {
            DiceTotalLabel.text = String(DiceNumber1 + DiceNumber2 + 2)
        }else
        if   DiceImage4.isHidden == true , DiceImage5.isHidden == true ,DiceImage6.isHidden == true
        { DiceTotalLabel.text = String(DiceNumber1 + DiceNumber2 + DiceNumber3 + 3)
            
        }else if DiceImage5.isHidden == true ,DiceImage6.isHidden == true
        { DiceTotalLabel.text = String(DiceNumber1 + DiceNumber2 + DiceNumber3 + DiceNumber4 +  4)
            
        }else if DiceImage6.isHidden == true
        { DiceTotalLabel.text = String(DiceNumber1 + DiceNumber2 + DiceNumber3 + DiceNumber4 + DiceNumber5 + 5)
            
        }else
        {
            DiceTotalLabel.text = String(DiceNumber1 + DiceNumber2 + DiceNumber3 + DiceNumber4 + DiceNumber5 + DiceNumber6 + 6)
            
        }
    
        
      
        
    
    }
    
    @IBAction func DiceStepperAction(_ sender: UIStepper)
    {
        let DiceAmount = Int(sender.value)
        DiceAmountLabel.text = String( DiceAmount)
        
        if sender.value == 0
        {   DiceImage1.isHidden = true
            DiceImage2.isHidden = true
            DiceImage3.isHidden = true
            DiceImage4.isHidden = true
            DiceImage5.isHidden = true
            DiceImage6.isHidden = true
            
        }
        else if sender.value == 1
        {   DiceImage1.isHidden = false
            DiceImage2.isHidden = true
            DiceImage3.isHidden = true
            DiceImage4.isHidden = true
            DiceImage5.isHidden = true
            DiceImage6.isHidden = true
        }else
        if sender.value == 2
        {  DiceImage1.isHidden = false
            DiceImage2.isHidden = false
            DiceImage3.isHidden = true
            DiceImage4.isHidden = true
            DiceImage5.isHidden = true
            DiceImage6.isHidden = true
            
        }else
        if  sender.value == 3
        {  DiceImage1.isHidden = false
            DiceImage2.isHidden = false
            DiceImage3.isHidden = false
            DiceImage4.isHidden = true
            DiceImage5.isHidden = true
            DiceImage6.isHidden = true
        }else
        if sender.value == 4
        {  DiceImage1.isHidden = false
            DiceImage2.isHidden = false
            DiceImage3.isHidden = false
            DiceImage4.isHidden = false
            DiceImage5.isHidden = true
            DiceImage6.isHidden = true
        }else
        if sender.value == 5
        {  DiceImage1.isHidden = false
            DiceImage2.isHidden = false
            DiceImage3.isHidden = false
            DiceImage4.isHidden = false
            DiceImage5.isHidden = false
            DiceImage6.isHidden = true
        }
        else if sender.value == 6
        {  DiceImage1.isHidden = false
            DiceImage2.isHidden = false
            DiceImage3.isHidden = false
            DiceImage4.isHidden = false
            DiceImage5.isHidden = false
            DiceImage6.isHidden = false
        }
        
        

        
        
        
        
        
        
        
        
    }
    

}
