import UIKit

func formattingStr(input: String) -> String {
    var returnString = ""
    var buffer = ""
    
    for char in input {
        if char.isLetter || char.isNumber {
            buffer.append(char)
        } else {
            continue
        }
        
        if buffer.count == 3 {
            returnString += buffer
            returnString += " "
            buffer = ""
        }
    }
    
    if buffer.isEmpty {
        returnString.popLast()
        return returnString
    }
    
    if buffer.isEmpty == false, buffer.count > 1 {
        returnString += buffer
    } else {
        let lastSpace = returnString.popLast()!
        let lastChar = returnString.popLast()!
        let lastSequence = String(lastChar) + buffer
        
        returnString += String(lastSpace)
        returnString += lastSequence
    }
    
    return returnString
}

let str1 = "AA-44 BB 55CD 83FG"
let str2 = "00-44 48 5555 8361"
let str3 = "0 - 22 1985 --324"
let str4 = "ABC372654"
let str5 = "ABCD"

// expected AA4 4BB 55C D83 FG
print("Formatting 1: \(formattingStr(input: str1).replacingOccurrences(of: " ", with: "_"))")

// expected 004 448 555 583 61
print("Formatting 2: \(formattingStr(input: str2).replacingOccurrences(of: " ", with: "_"))")

// expected 022 198 53 24
print("Formatting 3: \(formattingStr(input: str3).replacingOccurrences(of: " ", with: "_"))")

// expected ABC 372 654
print("Formatting 4: \(formattingStr(input: str4).replacingOccurrences(of: " ", with: "_"))")

// expected AB CD
print("Formatting 5: \(formattingStr(input: str5).replacingOccurrences(of: " ", with: "_"))")

