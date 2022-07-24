class Solution {
      
   var setCheck: Set<String> = ["&quot;", "&apos;", "&amp;", "&gt;", "&lt;", "&frasl;"]
   var dictGet: [String: String] = ["&quot;":"\"", "&apos;": "'", "&amp;": "&", "&gt;": ">", "&lt;": "<", "&frasl;": "/"]
    
    
   func entityParser(_ text: String) -> String {
      var textCompare: String = text
        
      for compare in setCheck where textCompare.contains(compare) {
         textCompare = textCompare.replacingOccurrences(of: compare, with: dictGet[compare] ?? "")
      }

      return textCompare
   }
}
