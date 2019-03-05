import Cocoa

public final class PasteBoardHelper {
    
   
    /**
     This method clean up url from "-","_",".","+" characters
     - Author:
     Sadeq Salehi
     
     - returns:
     A string of cleaned up input url.
     
     - parameters:
     - url: The url that will be cleaned up. Can not be empty.
     
     */
    static func setPasteboardItems(_ item: String)->Void{
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        pasteboard.setString(item, forType: NSPasteboard.PasteboardType.string)
        var clipboardItems: [String] = []
        for element in pasteboard.pasteboardItems! {
            if let str = element.string(forType: NSPasteboard.PasteboardType(rawValue: "public.utf8-plain-text")) {
                clipboardItems.append(str)
            }
        }
    }
    static func pasteboardStringContent() -> String
    {
        if NSPasteboard.general.pasteboardItems!.count > 0 {
            return (NSPasteboard.general.pasteboardItems?.first?.string(forType: .string))!
        }
        else{
            return ""
        }
        // return NSPasteboard.general.pasteboardItems?.first?.string(forType: .string)
    }
    static func pasteboardClearContents()->Void{
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        
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

    
    
}
