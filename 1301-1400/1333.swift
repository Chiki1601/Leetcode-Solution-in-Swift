class Solution {
     func filterRestaurants(_ restaurants: [[Int]], _ veganFriendly: Int, _ maxPrice: Int, _ maxDistance: Int) -> [Int] {
        var sortedRestaurants = [(id: Int, rating: Int)]()
        
        restaurants.forEach { rest in
            if (veganFriendly == 0 || veganFriendly == rest[2]) && rest[3] <= maxPrice && rest[4] <= maxDistance {
                sortedRestaurants.append((rest[0], rest[1]))
            }
        }

        sortedRestaurants.sort{ $0.rating > $1.rating || ($0.rating == $1.rating && $0.id > $1.id) }
        return sortedRestaurants.map { $0.id }
    }
}
