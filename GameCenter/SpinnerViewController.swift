

import UIKit

class SpinnerViewController: UIViewController
{
    
    //輪盤Image
    @IBOutlet weak var SpinnerImageView :SpinnerImageUIImageView!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()

       
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
