import UIKit

class FlipACoinViewController: UIViewController , UITextFieldDelegate
{  //問題
    @IBOutlet weak var QuestionTextField: UITextField!
    //正面
    @IBOutlet weak var FrontAnswerTextField: UITextField!
    //背面
    @IBOutlet weak var BackAnswerTextField: UITextField!
    //問題文字
    @IBOutlet weak var QuestionLabel: UILabel!
    //答案文字
    @IBOutlet weak var AnswerLabel: UILabel!
    //硬幣按鈕圖片
    @IBOutlet weak var CoinButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        QuestionTextField.delegate = self
        FrontAnswerTextField.delegate = self
        BackAnswerTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        

        
        
        
        //問題字數限制
      if textField == QuestionTextField
        {
        let QuesOfWords = string.count +
            QuestionTextField.text!.count - range.length
        if  QuesOfWords > 6
        {
            return false
        }
        //正面答案字數限制
        } else if textField == FrontAnswerTextField
        {
            let FrontOfWords = string.count +
                FrontAnswerTextField.text!.count - range.length
            if FrontOfWords > 4
            {
                return false
            }
            //反面答案字數限制
        } else if textField == BackAnswerTextField
        {     let  BackOfWords = string.count +
            BackAnswerTextField.text!.count - range.length
            if BackOfWords > 4
            {
                return false
            }
           
        }
        return true
    }
        
//        //如果空白跳出警告
//        if QuestionTextField.text?.isEmpty == nil ,FrontAnswerTextField.text?.isEmpty == nil , BackAnswerTextField.text?.isEmpty == nil
//        {
//            return true
//        }else
//        {
//            let controller = UIAlertController(title: "你漏寫囉", message: "填寫你的問題答案！！", preferredStyle: .alert)
//                       let okAction = UIAlertAction(title: "填寫", style: .default, handler: nil)
//                       controller.addAction(okAction)
//                       present(controller, animated: true, completion: nil)
//                       return false
//        }
//
//
//
//    }
//
    //點擊空白鍵盤消失
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Button 按鍵 變更硬幣選項及文字改變
    @IBAction func ShowCoinButton(_ sender: UIButton)
    {   //圖片隨機改變
        let CoinImage :[UIImage?] = [UIImage(named: "coinA"),UIImage(named: "coinB")]
        let Number = Int.random(in: 0...1)
        CoinButton.setImage(CoinImage[Number], for: .normal)
        //問題文字改變
        if QuestionTextField.text?.isEmpty == true{
            QuestionLabel.text = "你沒有問題來幹嘛?"
            
        }else
        {
            QuestionLabel.text = "問題為\(QuestionTextField.text!)?"
        }
        
        //回答文字改變
        if Number == 0 || QuestionTextField.text?.isEmpty == false
        {
            AnswerLabel.text = "結果為正！銅板建議你要\(AnswerLabel.text!)"
        }else if Number == 1 || QuestionTextField.text?.isEmpty == false
        {
            AnswerLabel.text = "結果為負！銅板建議你要\(AnswerLabel.text!)"
        }else
        {
            AnswerLabel.text = "沒有問題沒有答案"
        }
        
    }
    
    
    
    
    
    
    
}
