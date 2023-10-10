//Lecture 7 - Enum, Struct, Properties, Methods

task(for: 1, exercise: "შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.") {
    
    enum DayOfWeek: String {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    
    //checking with a SWITCH statement:
    func workOrRestV1(day: DayOfWeek) {
        switch day {
        case .saturday, .sunday:
            print("Rest day")
        case .monday, .tuesday, .wednesday, .thursday, .friday:
            print("Work day")
        }
    }
    
    //    checking with IF-ELSE statement:
    func workOrRestV2(day: DayOfWeek) {
        if day == .saturday || day == .sunday {
            print("Rest day")
        } else {
            print("Work day")
        }
    }
    workOrRestV1(day: .saturday)
    workOrRestV2(day: .monday)
}


task(for: 2, exercise: "შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.") {
    
    enum Weather {
        case sunny(temp: Double)
        case cloudy(temp: Double)
        case rainy(temp: Double)
        case snowy(temp: Double)
    }
    
    func weatherRecommendation(weather: Weather) -> String? {
        switch weather {
        case .sunny(let temp) where temp >= 30:
            return "It's hot. Wear as less clothes as possible."
        case .sunny(let temp) where temp >= 15 && temp < 30:
            return "It's moderate. Dress adequately."
        case .sunny(let temp) where temp < 15:
            return "It's quite cold. Wear a warm jacket and don't forget to wear a hat."
            
        case .cloudy(let temp) where temp  >= 30:
            return "It's hot but it might rain. Dress lightly and take an umbrella."
        case .cloudy(let temp) where temp >= 15 && temp < 30:
            return "It's moderate but it might rain. Dress adequately and take an umbrella."
        case .cloudy(let temp) where temp < 15:
            return "It's cold and might rain. Dress warmly and take an umbrella."
            
        case .rainy(let temp) where temp >= 30:
            return "It's hot but raining all day. Better to dress lightly and wear a raincoat and rubber boots."
        case .rainy(let temp) where temp >= 15 && temp < 30:
            return "It's moderate but raining all day. Better to wear a raincoat and rubber boots."
        case .rainy(let temp) where temp >= 0 && temp < 15:
            return "It's cold and raining all day. Better to dress warmly and wear a raincoat."
            
        case .snowy(let temp) where temp < 0 && temp > -20:
            return "It's very cold. Wear a warm jacket and all the winter accessorizes."
        case .snowy(let temp) where temp <= -20:
            return "It's extremely cold. Restrain yourself from going outside."
        default:
            return "Abnormal weather condition."
        }
    }
    weatherRecommendation(weather: Weather.snowy(temp: -22.5))
    weatherRecommendation(weather: Weather.sunny(temp: 40.5))
    weatherRecommendation(weather: Weather.sunny(temp: -10))
    weatherRecommendation(weather: Weather.cloudy(temp: 18))
    weatherRecommendation(weather: Weather.rainy(temp: 25))
}


task(for: 3, exercise: "შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.") {
    
    struct Book {
        var title: String
        var author: String
        var publicationYear: Int
    }
    
    var bookLibrary = [
        Book(title: "The Adventures of Sherlock Holmes", author: " Arthur Conan Doyle", publicationYear: 1892),
        Book(title: "Gone with the Wind", author: "Margaret Mitchell", publicationYear: 1936),
        Book(title: "The Catcher in the Rye", author: "J.D. Salinger", publicationYear: 1951),
        Book(title: "Mrs. Dalloway", author: "Virginia Woolf", publicationYear: 1925),
        Book(title: "Fried Green Tomatoes at the Whistle Stop Cafe", author: "Fannie Flagg", publicationYear: 1987),
        Book(title: "The Stranger", author: "Albert Camus", publicationYear: 1942)
    ]
    
    func searchForABook(library: [Book], year: Int) -> [Book] {
        let filteredBooks = library.filter { $0.publicationYear >= year }
        return filteredBooks
    }
    
    let filteredBooks = searchForABook(library: bookLibrary, year: 1930)
    
    for book in filteredBooks {
        print(book)
    }
}


task(for: 4, exercise: "შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.") {
    
    struct BankAccount {
        var holderName: String
        var accountNumber: Int
        var balance: Float
        
        init(holderName: String, accountNumber: Int, balance: Float) {
            self.holderName = holderName
            self.accountNumber = accountNumber
            self.balance = balance
        }
        //modifying the properties of the structure
        mutating func withdraw(money: Float) {
            if money > balance {
                print("You don't have enough money on your account.")
            } else if money <= 0 {
                print("You can't withdraw 0 or less than 0 money.")
            } else if money < 5 {
                print("The min amount of money you can withdraw is 5.")
            } else {
                //self. behind the scenes is defined by let keyword. so, in order to make the property defined in the struct to mutate we need to write mutating keyword in front of the function.
                balance -= money
                print("Money withdrawal in process. Your account now holds \(String(format: "%.2f", balance))") // formatting the float using "format string" to round up to 2 digits after the decimal point
            }
        }
        //modifying the properties of the structure
        mutating func deposit(money: Float) {
            if money <= 0 {
                print("You can't add 0 or less than 0 money on your deposit.")
            } else {
                balance += money
                print("Your account will be updated shortly. Your current balance is \(String(format: "%.2f", balance))") // formatting the float using "format string" to round up to 2 digits after the decimal point
            }
        }
    }
    
    var myBankAccount = BankAccount(holderName: "Mike Wazowski", accountNumber: 170299754395, balance: 2700.68)
    
    myBankAccount.deposit(money: 1500)
    myBankAccount.withdraw(money: 2000)
}


task(for: 5, exercise: "შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.") {
    
    enum Genre: String {
        case jazz, pop, rock, folk, soul, rap, country, classical
    }
    
    struct Song {
        var title: String
        var artist: String
        var duration: Float
        var genre: Genre
        lazy var publisher = "N/A"
        var description: String {
            mutating get {
                return "Title: \(title)\nArtist: \(artist)\nDuration: \(duration) seconds\nGenre: \(genre)\nPublisher: \(publisher)"
            }
        }
    }
    
    var myPlaylist: [Song] = [
        Song(title: "Unwritten", artist: "Natasha Bedingfield", duration: 4.19, genre: .pop, publisher: "Hal Leonard Corporation"),
        Song(title: "Mockingbird", artist: "Eminem", duration: 4.10, genre: .rap),
        Song(title: "At Last", artist: "Etta James", duration: 2.59, genre: .jazz, publisher: "Leeds Music Inc."),
        Song(title: "Let Down", artist: "Radiohead", duration: 4.59, genre: .rock)
    ]
    
    func playlistFilter(playlist: [Song], genre: Genre) -> [Song] {
        let filtered = playlist.filter { $0.genre == genre }
        return filtered
    }
    
    let filteredSong = playlistFilter(playlist: myPlaylist, genre: .jazz)
    for var song in filteredSong {
        print(song.description)
    }
}

