

import UIKit

class SpinnerViewController: UIViewController
{
    //切換輪盤SegmentedControl
    @IBOutlet weak var ChangeSpinner: UISegmentedControl!
    //輪盤Image
    @IBOutlet weak var SpinnerImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       
    }
    

 
    //切換輪盤SegmentedControlAction
    @IBAction func ChangeSpinnerAction(_ sender: Any)
    {
        let index = ChangeSpinner.selectedSegmentIndex
        switch index
        {
        case 0 : //4格輪盤
            SpinnerImage.image = UIImage(named: "Spinner4")
        case 1: //8格輪盤
            SpinnerImage.image = UIImage(named: "Spinner8")
        case 2 : //12格輪盤
            SpinnerImage.image = UIImage(named: "Spinner12")
        default:
            return
        }
    }
    
    
    
    
    
    
}
