import Foundation

struct Sport: Hashable {
    var name: String
    var teams: [Team] = []
}

struct Team: Hashable {
    var name: String
    var players: [Player] = []
}

struct Player: Hashable {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

class Model: ObservableObject {
    var baseball = Sport(name: "Baseball")
    var football = Sport(name: "Football")
    var hockey = Sport(name: "Hockey")
    
    @Published var sports: [Sport] = []
    
    init() {
        var team = Team(name: "Cardinals")
        team.players.append(Player("Yadier Molina"))
        team.players.append(Player("Adam Wainwright"))
        baseball.teams.append(team)
        
        team = Team(name: "Cubs")
        team.players.append(Player("Jason Heyward"))
        team.players.append(Player("Patrick Wisdom"))
        baseball.teams.append(team)
        
        team = Team(name: "Buccaneers")
        team.players.append(Player("Tom Brady"))
        team.players.append(Player("Rob Gronkowski"))
        football.teams.append(team)
        
        team = Team(name: "Packers")
        team.players.append(Player("Aaron Rodgers"))
        team.players.append(Player("Davante Adams"))
        football.teams.append(team)
        
        team = Team(name: "Blues")
        team.players.append(Player("Vladimir Tarsenko"))
        team.players.append(Player("Jordan Binnington"))
        hockey.teams.append(team)
        
        team = Team(name: "Blackhawks")
        team.players.append(Player("Marc-Andre Fleury"))
        team.players.append(Player("Jonathan Toews"))
        hockey.teams.append(team)
        
        sports.append(baseball)
        sports.append(football)
        sports.append(hockey)
    }
    
}
