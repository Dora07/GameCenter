
import UIKit

class SpinnerImageUIImageView: UIImageView
{

    var CurrentValue :Double = 0
    func RotateGradually(handler:@escaping(String)->())
    {
        var Result = ""
      
        //// 產生0~2pi隨機的Double數字,也就是0~360度。
        let RandomDouble = Double.random(in: 0..<2 * Double.pi)
        let RotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        CATransaction.begin()
        RotateAnimation.fromValue = CurrentValue
        //開始到結束之,總共了50圈加上randomDouble度。
        CurrentValue = CurrentValue + 100 * Double.pi + RandomDouble
        // //取得currentale/Doublepi*2餘數
        let Value = CurrentValue.truncatingRemainder(dividingBy: Double.pi * 2)
        //將弧度轉成角度
        let Degree = Value * 180/Double.pi
        
        //依照不同角度判斷轉到區塊
        switch Degree{
                    case 240..<270:
                    Result="1"
                    case 210..<240:
                    Result="2"
                    case 180..<210:
                    Result="3"
                    case 150..<180:
                    Result="4"
                    case 120..<150:
                    Result="5"
                    case 90..<120:
                    Result="6"
                    case 60..<90:
                    Result="7"
                    case 30..<60:
                    Result="8"
                    case 0..<30:
                    Result="9"
                    case 333..<360:
                    Result="10"
                    case 300..<330:
                    Result="11"
                    case 270..<300:
                    Result="12"
                    default:
                    Result="未知"
                }
        RotateAnimation.toValue = CurrentValue
        //動畫結束後仍保在結束狀態,讓轉盤不會在動畫結束時回到最初狀態。便繼再次轉動。
        RotateAnimation.isRemovedOnCompletion = false
        RotateAnimation.fillMode = .forwards
        //動畫持續時間
        RotateAnimation.duration = 5
        //重複幾次
        RotateAnimation.repeatCount = 1
        //跑完動後要做的事
        CATransaction.setCompletionBlock
        {  //動畫結束後暫停0.3秒
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3)
            {
                handler(Result)
            }
            
        }
        //用cubic Bezier curve決定動畫速率曲線
        RotateAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0, 0.9, 0.4, 1.00)
        //也可以用內建的easeOut,但我想要最後轉一點
        self.layer.add(RotateAnimation, forKey: nil)
        CATransaction.commit()
        
        
    }
    

}
