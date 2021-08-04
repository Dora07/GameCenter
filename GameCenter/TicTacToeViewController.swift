
import UIKit

class TicTacToeViewController: UIViewController
{
    let grid: Grid = Grid()
    
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
        var TargetIndex:Int?
        for (i ,square) in Squares.enumerated()
        {
            let InterSectionFrame =  square.frame.intersection(label.frame)
            let Area = InterSectionFrame.width * InterSectionFrame.height
            if  Area > MaxIntersectionArea
            {
                MaxIntersectionArea = Area
                TargetSquare = square
                TargetIndex = i
            }
        }
        if let TargerSquare = TargetSquare, let TargetIndex = TargetIndex,grid.IsSquareEmpty(index:TargetIndex)
        {
            Placepiece(label,on:TargerSquare,index:TargetIndex)
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
    
   
    
    func Placepiece(_ label :UILabel ,on sqauare:UIView,index : Int)
    {
        var OriginalPieceCenter = CGPoint.zero
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [], animations:{
            label.transform = .identity
            OriginalPieceCenter = label.center
            label.center = sqauare.center
        })
        {(_)in
            self.FinishCurrentTurn(label: label, index:index,originalPieceCenter: OriginalPieceCenter)
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
    
    
    
    var OccupyPices = [UILabel]()
    
    func FinishCurrentTurn(label:UILabel, index:Int,originalPieceCenter:CGPoint)
    {
        OccupyPices.append(label)
     let NewLabel = CreatPieceLabel(label: label)
        NewLabel.center = originalPieceCenter
        view.addSubview(NewLabel)
        
        let NextLabel : UILabel
        
        if label == XLabel
        {  self.grid.Occupy(piece: .X, on: index)
            XLabel = NewLabel
            TakeTurn(label: OLabel)
            NextLabel = OLabel
        }else
        { self.grid.Occupy(piece: .O, on: index)
            OLabel = NewLabel
            TakeTurn(label: XLabel)
            NextLabel = XLabel
        }
        if grid.WinnerLines.isEmpty == false
        { grid.WinnerLines.forEach{(indexs)in
            ShowWinLineAnimation(startPoint: Squares[indexs.first!].center, endPoint: Squares[indexs.last!].center)
        }
            
        }
            else if grid.IsTie
            {
                infoView.Show(text: "ドロー")
            }else
            {
                TakeTurn(label: NextLabel)
            }
        
    }
    
    @IBAction func CloseInfoView(_sender:Any)
    {
        infoView.Close()
        if grid.Winner != nil || grid.IsTie
        {
            NewGame()
        }
    }
    
    func NewGame()
    { grid.Clear()
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 1, options: [], animations: {
            self.OccupyPices.forEach { (piece)in piece.alpha = 0
                
            }
            
        }) {(_)in
            self.OccupyPices.forEach {(piece)in piece.removeFromSuperview()
        }
            self.OccupyPices.removeAll()
            self.TakeTurn(label: self.OLabel)
        }
        
    }
    
    
    func ShowWinLineAnimation(startPoint:CGPoint,endPoint:CGPoint)
    {
        let Path = UIBezierPath()
        Path.move(to: startPoint)
        Path.addLine(to: endPoint)
        
        let ShapeLayer = CAShapeLayer()
        ShapeLayer.path = Path.cgPath
        ShapeLayer.strokeColor = UIColor.red.cgColor
        ShapeLayer.lineWidth = 15
        ShapeLayer.lineCap = .round
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(3)
        
        let StrokeAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        StrokeAnimation.fromValue = 0
        StrokeAnimation.toValue = 1
        CATransaction.setCompletionBlock
        {
            ShapeLayer.removeFromSuperlayer()
            
            if let Winner = self.grid.Winner
            {
                if Winner == Grid.Piece.O
                {
                    self.infoView.Show(text: "おめでとう！O勝った！")
                }else
                {
                    self.infoView.Show(text: "おめでとう！X勝った！")
                }
            }
            
        }
        
        ShapeLayer.add(StrokeAnimation, forKey: nil)
        view.layer.addSublayer(ShapeLayer)
        CATransaction.commit()
        
    }
    
    
    
    
    
    
    
}

