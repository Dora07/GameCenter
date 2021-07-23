
import UIKit

class TicTacToeViewController: UIViewController
{

    
    @IBOutlet var Squares: [UIView]!
    
    @IBOutlet weak var XLabel: UILabel!
    @IBOutlet weak var OLabel: UILabel!
    
    @IBOutlet weak var infoView: InfoView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
 TakeTurn(label: OLabel)
       
    }
    
    @IBAction func InfoViewButtonAction(_ sender: Any)
    {
        infoView.Show(text:"1列に3個自分のマークを並べると勝ち!!")
    }
    
    @IBAction func InFoOkButtonAction(_ sender: Any)
    {
        infoView.Close()
    }
    
    func TakeTurn(label:UILabel)
    {
        let RotateAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeIn)
        {
            label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            label.alpha = 0.75
        }
        
        let BackAnimator = UIViewPropertyAnimator(duration: 1, curve:  .easeOut)
        {
            label.transform = CGAffineTransform.identity
            label.alpha = 1
        }
        BackAnimator.addCompletion
        {(_)in
            label.isUserInteractionEnabled = true
            self.view.bringSubviewToFront(label)
            
        }
        RotateAnimator.addCompletion
        {(_)in
            BackAnimator.startAnimation()
        }
        RotateAnimator.startAnimation()
    }
    
    
    @IBAction func MovePiece(_ sender: UIPanGestureRecognizer)
    {   guard let label = sender.view as? UILabel else
        {
        return
        }
    if sender.state == .ended
    {
    
    }
        
        let Translation = sender.translation(in: view)
        
    }
    
    
    
}
