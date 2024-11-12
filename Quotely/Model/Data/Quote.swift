//
//  Untitled.swift
//  Quotely
//
//  Created by Maxim Svidrak on 12.11.24.
//

struct Quote: Codable {
    var id: String
    var text: String
    var author: String
    var category: String
    var language: String
}

 let dummyQuotes: [Quote] = [
    Quote(id: "1", text: "Erfolg ist die Summe kleiner Anstrengungen, die Tag für Tag wiederholt werden.", author: "Friedrich Nietzsche", category: "success", language: "DE"),
    Quote(id: "2", text: "Der Weg ist das Ziel.", author: "Konfuzius", category: "motivation", language: "DE"),
    Quote(id: "3", text: "Wer kämpft, kann verlieren. Wer nicht kämpft, hat schon verloren.", author: "Bertolt Brecht", category: "perseverance", language: "DE"),
    Quote(id: "4", text: "Habe keine Angst vor dem Scheitern. Fürchte dich davor, es nicht einmal zu versuchen.", author: "Unbekannt", category: "courage", language: "DE"),
    Quote(id: "5", text: "Das Leben ist wie Fahrradfahren. Um die Balance zu halten, musst du in Bewegung bleiben.", author: "Albert Einstein", category: "life", language: "DE"),
    Quote(id: "6", text: "Nur wer riskiert, zu weit zu gehen, kann herausfinden, wie weit man gehen kann.", author: "T.S. Eliot", category: "inspiration", language: "DE"),
    Quote(id: "7", text: "Der größte Ruhm im Leben liegt nicht darin, nie zu fallen, sondern jedes Mal wieder aufzustehen.", author: "Nelson Mandela", category: "resilience", language: "DE"),
    Quote(id: "8", text: "Gib nicht auf, denn du weißt nie, wie nah du am Ziel bist.", author: "Unbekannt", category: "perseverance", language: "DE"),
    Quote(id: "9", text: "Die beste Zeit für einen Neuanfang ist jetzt.", author: "Unbekannt", category: "motivation", language: "DE"),
    Quote(id: "10", text: "Deine Zeit ist begrenzt, also verschwende sie nicht damit, das Leben eines anderen zu leben.", author: "Steve Jobs", category: "life", language: "DE"),
    Quote(id: "11", text: "Träume groß und wage es, zu scheitern.", author: "Norman Vaughan", category: "dream", language: "DE"),
    Quote(id: "12", text: "Eine Reise von tausend Meilen beginnt mit einem einzigen Schritt.", author: "Laozi", category: "journey", language: "DE"),
    Quote(id: "13", text: "Das größte Risiko ist es, kein Risiko einzugehen.", author: "Mark Zuckerberg", category: "risk", language: "DE"),
    Quote(id: "14", text: "Was du heute kannst besorgen, das verschiebe nicht auf morgen.", author: "Deutsches Sprichwort", category: "procrastination", language: "DE"),
    Quote(id: "15", text: "Jeder Tag ist eine neue Chance, das zu tun, was du möchtest.", author: "Friedrich Nietzsche", category: "opportunity", language: "DE"),
    Quote(id: "16", text: "Die Zukunft gehört denen, die an die Schönheit ihrer Träume glauben.", author: "Eleanor Roosevelt", category: "dream", language: "DE"),
    Quote(id: "17", text: "Nur wer sein Ziel kennt, findet den Weg.", author: "Laozi", category: "goal", language: "DE"),
    Quote(id: "18", text: "Nicht die Glücklichen sind dankbar. Es sind die Dankbaren, die glücklich sind.", author: "Francis Bacon", category: "happiness", language: "DE"),
    Quote(id: "19", text: "Das Geheimnis des Vorwärtskommens besteht darin, den ersten Schritt zu tun.", author: "Mark Twain", category: "motivation", language: "DE"),
    Quote(id: "20", text: "Der beste Weg, die Zukunft vorherzusagen, ist, sie zu gestalten.", author: "Peter Drucker", category: "future", language: "DE")
]
