
import Foundation

class Grid{

    enum Piece
    {
        case O
        case X
    }

    
    let SquareCount = 9
    lazy var Squares = [Piece?](repeating: nil, count: SquareCount)
    
    let Lines = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var Winner : Piece?
    {
        var Winner : Piece?
        
        for Line in Lines
        {
            if let FirstPiece = Squares[Line[0]]
            {
                let Result = Line.allSatisfy{(index) -> Bool in
                    return Squares[index] == FirstPiece
                }
                if Result
                {
                    Winner = FirstPiece
                    break
                }
            }
        }
      
        
        return Winner
      
        }
    
    var IsFull :Bool
    {
        return Squares.indices.allSatisfy{(index)-> Bool in return IsSquareEmpty(index: index) == false }
    }
    var IsTie : Bool
    { if IsFull , Winner == nil
    {
        return true
    }else
    {
        return false
    }
        
    }
    func IsSquareEmpty(index: Int) -> Bool {
        return Squares[index] == nil
    }
    func  Occupy(piece:Piece, on index : Int)
    {
        Squares[index] = piece
    }
   
    func Clear ()
    {
        Squares =  [Piece?](repeating: nil, count: SquareCount)
    }
    
    var WinnerLines:[[Int]]
    {
        var WinnerLines = [[Int]]()
        for line in Lines
        {
            if let FirstPiece = Squares[line[0]]
            {
                let Result = line.allSatisfy{(index)->Bool
                    in return Squares[index] == FirstPiece }
                
            
            if Result{
                WinnerLines.append(line)
            }
            
        }
        }
        
        return WinnerLines
        
    }
    

    
    

}
