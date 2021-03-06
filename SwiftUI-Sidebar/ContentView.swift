import SwiftUI

private let people = [
    "Mark",
    "Tami",
    "Amanda",
    "Jeremy",
    "Meghan",
    "RC"
]

struct SportsView: View {
    @ObservedObject var model: Model
    @Binding var selectedSport: Sport?
    @Binding var selectedTeam: Team?

    var body: some View {
        VStack {
            Text("Sports").font(.headline)
            List(model.sports, id: \.self) { sport in
                NavigationLink(
                    destination: TeamsView(
                        selectedSport: $selectedSport,
                        selectedTeam: $selectedTeam
                    ),
                    tag: sport,
                    selection: $selectedSport
                ) {
                    Text(sport.name)
                }
            }.listStyle(.sidebar)
        }
    }
}

struct TeamsView: View {
    @Binding var selectedSport: Sport?
    @Binding var selectedTeam: Team?

    var body: some View {
        VStack {
            Text(selectedSport?.name ?? "None").font(.headline)
            List(selectedSport?.teams ?? [], id: \.self) { team in
                NavigationLink(
                    destination: PlayersView(
                        selectedTeam: $selectedTeam
                    ),
                    tag: team,
                    selection: $selectedTeam

                ) {
                    Text(team.name)
                }
            }
        }
    }
}

struct PlayersView: View {
    @Binding var selectedTeam: Team?

    var body: some View {
        VStack {
            Text(selectedTeam?.name ?? "None").font(.headline)
            List(selectedTeam?.players ?? [], id: \.self) { player in
                Text(player.name)
            }
        }
    }
}

struct ContentView: View {
    @State private var selectedSport: Sport?
    @State private var selectedTeam: Team?

    var model: Model

    var body: some View {
        NavigationView {
            SportsView(
                model: model,
                selectedSport: $selectedSport,
                selectedTeam: $selectedTeam
            )
            Text("Select a sport")
            Text("Select a team")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}
