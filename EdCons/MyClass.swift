//
//  MyClass.swift
//  EdCons
//
//  Created by Edmund Quek on 2/12/18.
//  Copyright © 2018 Edmund Quek. All rights reserved.
//

import Foundation




class MyClass
{
    func splitWord(_ word: String) -> [String]
    {
        let tileCount = word.count / 2
        
        let rand: Int = Int(arc4random_uniform(UInt32(tileCount)))
        
        let mod = word.count % 2
        
        var addon = 2;
        
        var returnArray : [String] = Array()
        
        var counter = 0
        
        //for var i = 0; i < tileCount * 2; i = i + addon
        
        for i in stride(from: 0, to: tileCount * 2, by: addon)
        {
            if counter == rand && mod == 1
            {
                addon = 3
            }
            else
            {
                addon = 2
            }
            
            let r = Range(word.index(word.startIndex, offsetBy: i) ..< word.index(word.startIndex, offsetBy: i + addon))
            
            //     print(word[r])
            
            returnArray.append(String(word[r]))
            
            counter = counter + 1
        }
        
        
        
        let r1 = Int(arc4random_uniform(UInt32(returnArray.count)))
        
        var r2 : Int
        
        repeat
        {
            r2 = Int(arc4random_uniform(UInt32(returnArray.count)))
        }
        while (r2 == r1)
        
        
        returnArray[r1] = String(returnArray[r1].reversed())
        returnArray[r2] = String(returnArray[r2].reversed())
        
        returnArray.shuffle()
        
        return returnArray
    }
    
    //
    //
    //func scramble(word: String) -> String {
    //    var chars = Array(word.characters)
    //    var result = ""
    //
    //    while chars.count > 0 {
    //        let index = Int(arc4random_uniform(UInt32(chars.count - 1)))
    //        chars[index].writeTo(&result)
    //        chars.removeAtIndex(index)
    //    }
    //
    //    return result
    //}
    //
    

    
    
    
}




extension Array
{
    mutating func shuffle()
    {
        if count < 2 { return }
        
        for i in 0..<(count - 1)
        {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            
            if (i != j)
            {
                self.swapAt(i, j)
            }
        }
    }
}
