

import UIKit

class SpinnerViewController: UIViewController
{
    //切換輪盤SegmentedControl
    @IBOutlet weak var ChangeSpinner: UISegmentedControl!
    //輪盤Image
    @IBOutlet weak var SpinnerImage: UIImageView!
    @IBOutlet weak var SpinnerImageView :SpinnerImageUIImageView!
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
    
    
    @IBAction func SpinnerAction(_ sender: UIButton)
    {
        SpinnerImageView.RotateGradually
        {
          Result in
            let ALertContoller = UIAlertController(title: "你轉到了\(Result)區塊", message: nil, preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "確認", style: .cancel, handler: nil)
            ALertContoller.addAction(OkAction)
            self.present(ALertContoller, animated: true)
        }
        
    }
    
    
    
    
}
