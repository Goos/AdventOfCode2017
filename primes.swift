func generatePrimes(ceiling: Int) -> [Int] {
    var primeTable = [Bool](repeating: true, count: ceiling)
    let root = Int(Float(ceiling).squareRoot())
    for index in 2...root {
        if primeTable[index] {
            var count = 0
            var nonPrimeIndex = index * index
            repeat {
                primeTable[nonPrimeIndex] = false

                nonPrimeIndex = index * index + index * count
                count += 1
            } while nonPrimeIndex < ceiling
        }
    }

    var primes = [Int]()
    for indexedValue in primeTable[2..<ceiling].enumerated() {
        let (index, isPrime) = indexedValue
        if isPrime {
            primes.append(index + 2)
        }
    }
    return primes
}

