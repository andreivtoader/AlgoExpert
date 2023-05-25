import UIKit

class Program {
  let HOME_TEAM_WON = 1
  let AWAY_TEAM_WON = 0

    func tournamentWinner(_ competitions: [[String]], _ results: [Int]) -> String {
        var scoreboard = [String: Int]()
        
        for index in 0..<results.count {
            let homeTeam = competitions[index][0]
            let awayTeam = competitions[index][1]
            
            if results[index] == HOME_TEAM_WON {
                scoreboard[homeTeam] = (scoreboard[homeTeam] ?? 0) + 3
            }
            else if results[index] == AWAY_TEAM_WON {
                scoreboard[awayTeam] = (scoreboard[awayTeam] ?? 0) + 3
            }
        }
        
        let winner = scoreboard.max(by: {$0.value < $1.value})
        
        return winner?.key ?? ""
    }
}

