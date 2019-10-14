/**

                            Online Swift Compiler.
                Code, Compile, Run and Debug Swift script online.
Write your code in this editor and press "Run" button to execute it.

*/
import Foundation

enum Windows {
    case open, close
}

enum Engin {
    case start, stop
}

enum Body {
    case bagagnik, kuzov
}

enum Work {
    case p20, p50, g20, g50
}

struct Auto {
    let marka : String
    let age : Int
    let volumbody : Int
    var windows : Windows
    var engin : Engin
    let body : Body
    var volumenew : Int
    
    init(marka: String, age: Int, volumbody: Int, windows: Windows, engin: Engin, body: Body, volumenew: Int) {
        self.marka = marka  
        self.age = age
        self.volumbody = volumbody
        self.windows = windows
        self.engin = engin
        self.body = body
        self.volumenew = volumenew
    }
    
    func getInfo() -> String{
        return "Марка: \(marka). Год выпуска: \(age). Тип багажника: \(body). Объем багажника: \(volumbody) кг. Двигатель в работе: \(engin). Окна: \(windows). Погружено: \(volumenew) кг."
    }
    
    mutating func pogruzka(work: Work){
        self.windows = .open
        self.engin = .stop
        
        if volumenew == 0{
            switch work {
                case .p20: 
                    volumenew += 20
                case .p50: 
                    volumenew += 50
                default:
                    print("Возможна только погрузка, машина пуста")
                }
        } else {
        switch work {
               case .p20: 
                  volumenew += 20
               case .p50: 
                  volumenew += 50
               case .g20: 
                   volumenew -= 20
               case .g50: 
                  volumenew -= 50
            }
        }
    }
}

var auto1 = Auto(marka: "Mazda",age: 2012, volumbody: 70, windows: .close, engin: .start, body: .bagagnik, volumenew: 0)
print(auto1.getInfo()) 
auto1.pogruzka(work: .g50)

var auto2 = Auto(marka: "Kamaz",age: 1992, volumbody: 700, windows: .close, engin: .start, body: .kuzov, volumenew: 100)
print(auto2.getInfo()) 
auto2.pogruzka(work: .p50)
print(auto2.getInfo()) 
