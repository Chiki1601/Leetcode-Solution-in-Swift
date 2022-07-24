
class ProductOfNumbers {

     private var products: [Int]

    
    init() { products = [] }

    
    func add(_ num: Int) {
        if num == 0 {
            products = []
        } else {
            if let prev = products.last {
                products.append(prev * num)
            } else {
                products.append(num)
            }
        }
    }

    
    func getProduct(_ k: Int) -> Int {
        if k > products.count {
            return 0
        } else if k == products.count {
            return products.last!
        } else {
            return products.last! / products[products.count - k - 1]
        }
    }
    
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */
