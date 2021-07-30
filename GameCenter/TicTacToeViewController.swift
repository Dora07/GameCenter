
import UIKit

class TicTacToeViewController: UIViewController
{

    
    @IBOutlet var Squares: [UIView]!
    
    @IBOutlet weak var XLabel: UILabel!
    @IBOutlet weak var OLabel: UILabel!
    
    @IBOutlet weak var infoView: InfoView!
    
    @IBOutlet var GestureRecognizer: UIPanGestureRecognizer!
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
            label.isUserInteractionEnabled
                = true
            label.addGestureRecognizer(self.GestureRecognizer)
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
    { var MaxIntersectionArea :CGFloat = 0
        var TargetSquare :UIView?
        for square in Squares
        {
            let InterSectionFrame =  square.frame.intersection(label.frame)
            let Area = InterSectionFrame.width * InterSectionFrame.height
            if  Area > MaxIntersectionArea
            {
                MaxIntersectionArea = Area
                TargetSquare = square
            }
        }
        if let TargerSquare = TargetSquare
        {
            Placepiece(label, on: TargerSquare)
        }else
        {
            PiceBackToStartLocation(label: label)
        }
        PiceBackToStartLocation(label: label)
    }else
    {
        let Translation = sender.translation(in: view)
    label.transform = CGAffineTransform(translationX: Translation.x, y: Translation.y)
        
    }
    
    }
    
    func PiceBackToStartLocation(label:UILabel)
    {
        UIView.animate(withDuration: 0.5)
        {
            label.transform = .identity
        }
    }
    
   
    
    func Placepiece(_ label :UILabel ,on sqauare:UIView )
    {
        var OriginalPieceCenter = CGPoint.zero
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [], animations:{
            label.transform = .identity
            OriginalPieceCenter = label.center
            label.center = sqauare.center
        })
        {(_)in
            self.FinishCurrentTurn(label: label, originalPieceCenter: OriginalPieceCenter)
        }
        
    }
    
    func CreatPieceLabel(label:UILabel) -> UILabel
    { let NewLabel = UILabel(frame: label.frame)
        NewLabel.text = label.text
        NewLabel.font = label.font
        NewLabel.backgroundColor = label.backgroundColor
        NewLabel.textColor = label.textColor
        NewLabel.textAlignment = label.textAlignment
        NewLabel.alpha = 0.5
        NewLabel.isUserInteractionEnabled = false
        return NewLabel
        
    }
    
    
    
    
    
    func FinishCurrentTurn(label:UILabel, originalPieceCenter:CGPoint)
    {
     let NewLabel = CreatPieceLabel(label: label)
        NewLabel.center = originalPieceCenter
        view.addSubview(NewLabel)
        
        if label == XLabel
        { XLabel = NewLabel
            TakeTurn(label: OLabel)
        }else
        {
            OLabel = NewLabel
            TakeTurn(label: XLabel)
        }
    }
    
    
}
