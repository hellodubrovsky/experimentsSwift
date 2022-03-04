import UIKit

/// Create and use closures.

let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

print(sayHello("Brain"))



func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)



let team = ["Alex", "Mark", "Taylor", "Piper", "Tony"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(nameFirst: String, nameSecond: String) -> Bool {
    if nameFirst == "Mark" {
        return true
    } else if nameSecond == "Mark" {
        return false
    }
    return nameFirst < nameSecond
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (nameFirst: String, nameSecond: String) -> Bool in
    if nameFirst == "Mark" {
        return true
    } else if nameSecond == "Mark" {
        return false
    }
    return nameFirst < nameSecond
})

print("\n", captainFirstTeam)




/// How to use trailing closures and shorthand syntax

let captainFirstTeam_2 = team.sorted { nameFirst, nameSecond in
    if nameFirst == "Mark" {
        return true
    } else if nameSecond == "Mark" {
        return false
    }
    return nameFirst < nameSecond
}

print("\n", captainFirstTeam_2)

let captainFirstTeam_3 = team.sorted {
    if $0 == "Mark" {
        return true
    } else if $1 == "Mark" {
        return false
    }
    return $0 < $1
}

print("\n", captainFirstTeam_3)

let reverseTeam = team.sorted { $0 > $1 }
print("\n", reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T")}
print("\n", tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print("\n", uppercaseTeam)
