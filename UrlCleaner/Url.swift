import Cocoa

public final class Url {
    private init() {
        self.url="sample-link_whith+special.characters"
    }
    var url:String="";
    /**
     This method clean up url from "-","_",".","+" characters
     - Author:
     Sadeq Salehi
     
     - returns:
     A string of cleaned up input url.
     
     - parameters:
        - url: The url that will be cleaned up. Can not be empty.
     
     */
    static func cleanUpUrl(_ url:String) -> String{
        var replacedUrl = url
        let specialChars : [String] = ["-","_",".","+"]
        for char in specialChars {
            replacedUrl = replacedUrl.replacingOccurrences(of: char, with: " ")
        }
        return replacedUrl
        
    }
    /**
     This method clean up url from special characters
     - Author:
     Sadeq Salehi
     
     - returns:
     A string of cleaned up input url.
     
     - parameters:
        - url: The url that will be cleaned up. Can not be empty.
        - specialChars: List of special characters that will be find and cleaned up.
     */
    static func cleanUpUrl(_ url:String,_ specialChars:Array<String>) -> String{
        var replacedUrl = url
        
        for char in specialChars {
            replacedUrl = replacedUrl.replacingOccurrences(of: char, with: " ")
        }
        return replacedUrl
    }
    /**
     This method clean up url from special characters and replaced with specific character.
     - Author:
     Sadeq Salehi
     - returns:
     A string of cleaned up input url.
     
     - parameters:
        - url: The url that will be cleaned up. Can not be empty.
        - specialChars: List of special characters that will be find and cleaned up.
        - chararacter: The character
     */
    static func replaceWith(_ url:String,_ specialChars:Array<String>,_ chararacter:String) -> String{
        var replacedUrl = url
        
        for char in specialChars {
            replacedUrl = replacedUrl.replacingOccurrences(of: char, with: chararacter)
        }
        return replacedUrl
    }}
