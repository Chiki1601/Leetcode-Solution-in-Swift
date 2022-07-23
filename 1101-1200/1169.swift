class Transaction {
    let name:String
    let time:Int
    let price:Int
    let city:String
    var isVaild:Bool
    

    init(transaction: String) {
        let info = transaction.split(separator: ",")
        self.name = String(info[0])
        self.time = Int(String(info[1]))!
        self.price = Int(String(info[2]))!
        self.city = String(info[3])
        self.isVaild = self.price <= 1000
    }

    
    func isVaild(with other:Transaction) -> Bool{
        if self.isVaild {
            self.isVaild = other.city == city ||
                abs(other.time - time) > 60
            other.isVaild = other.isVaild && self.isVaild
        }
        return self.isVaild
    }
    
    
    func toString() -> String { "\(name),\(time),\(price),\(city)" }

}


class Solution {
   
    func invalidTransactions(_ transactions: [String]) -> [String] {
        var map = [String: [Transaction]]()
        var result = [Transaction]()

        for transaction in transactions {
            let entiy = Transaction(transaction: transaction)
            if var value = map[entiy.name]{
                value.append(entiy)
                map[entiy.name] = value
            } else {
                map[entiy.name] = [entiy]
            }
        }
        
        for (_,value) in map {
            for transaction in value {
                for other in value where !transaction.isVaild(with: other) { result.append(transaction); break }
            }
        }
        
        return result.map({ $0.toString() })
    }
}
