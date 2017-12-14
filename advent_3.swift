func findShortestPath(input: Int) -> Int {
    let gridWidth = findGridWidth(step: input)

    let straightPathSteps = findStepsWithStraightPaths(gridWidth: gridWidth)
    let distanceFromClosestStraightPath = straightPathSteps.reduce(Int.max, { minDistance, step in
        let distance = abs(input - step)
        return distance < minDistance ? distance : minDistance
    })

    // A straight path always has the distance of half the grid's width rounded down. Since
    // we're looking for the manhattan distance (i.e. no diagonal movement), we can deduce 
    // the distance by adding the distance between the closest straight path and the straight
    // path distance together.
    let straightPathDistance = gridWidth / 2
    return distanceFromClosestStraightPath + straightPathDistance
}

// Returns the four step indices that have straight paths to the middle
func findStepsWithStraightPaths(gridWidth: Int) -> [Int] {
    // The index of the last step in the provided grid
    let lastStep = gridWidth * gridWidth
    // The distance between the last step and the first straight path
    let edgeDistance = gridWidth / 2
    // Generates the indices of the four straight paths within the grid by going 
    // backwards from the last step
    return Array(0..<4).map { lastStep - (edgeDistance + $0 * 2 * edgeDistance) }
}


// Returns the width of the grid for an index in a spiral pattern of increasing indices
func findGridWidth(step: Int) -> Int {
    // The width of the grid will always be equal to the final step of a spiral
    let root = Int(Float(input).squareRoot())
    
    // The grid width will always be an uneven integer and grids always grow in increments
    // of two, so an even integer means that the grid is 1 greater than the root
    if root % 2 == 0 {
        return root + 1
    // If the index is uneven but there is a remainder when subtracting the square of the grid
    // width, the step is the beinning of a new spiral
    } else if input - root * root > 0 {
        return root + 2
    } else {
        return root
    }
}

print(findShortestPath(input: 277678))
