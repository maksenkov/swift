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

enum Moschnost {
    case m250, m350
}

enum Vmestimost {
    case t100, t200
}

enum Body {
    case bagagnik, kuzov
}

enum Work {
    case p20, p50, g20, g50
}

class Auto {
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

    func pogruzka(work: Work){
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

class sportCar : Auto {
    var ls : Moschnost
        
    init(marka: String, age: Int, volumbody: Int, windows: Windows, engin: Engin, body: Body, volumenew: Int, ls: Moschnost) {
        self.ls = ls
        super.init(marka: String, age: Int, volumbody: Int, windows: Windows, engin: Engin, body: Body, volumenew: Int) 
 
    }
    func tuning(){
        self.ls = .m350
        self.engin = .start
    }
    
    override func getInfo() -> String{
        return "Марка: \(marka). Год выпуска: \(age). Двигатель в работе: \(engin). Мощность: \(ls)."
    }
}

class trunkCar : Auto {
    var kuz : Vmestimost
        
    init(marka: String, age: Int, volumbody: Int, windows: Windows, engin: Engin, body: Body, volumenew: Int, kuz: Vmestimost) {
        self.kuz = kuz
        super.init(marka: String, age: Int, volumbody: Int, windows: Windows, engin: Engin, body: Body, volumenew: Int) 
    }
 
    override func pogruzka(){
        self.windows = .open
        self.engin = .stop

        if volumenew == 0{
            print("Возможна только погрузка, машина пуста. Загружаем до \(kuz)")
        } 
        else {
            switch kuz {
               case .t100: 
                  print("Машина уже наполнена до 100т")
               case .t200: 
                  print("Машина уже наполнена до 100т")
               default: 
                  print("Ошибка")
            }
    }
    
    override func getInfo() -> String{
        return "Марка: \(marka). Год выпуска: \(age). Двигатель в работе: \(engin). Вместимость: \(kuz)."
    }
}

var auto1 = Auto(marka: "Mazda",age: 2012, volumbody: 70, windows: .close, engin: .start, body: .bagagnik, volumenew: 0)
print(auto1.getInfo()) 
auto1.pogruzka(work: .g50)

var sportauto = SportCar(marka: "Ferrary",age: 1992, volumbody: 10, windows: .close, engin: .stop, body: .bagagnik, volumenew: 100, ls: .m250)
print(sportauto.getInfo()) 
sportauto.tuning()
print(sportauto.getInfo()) 

var trunkauto = trunkCar(marka: "Man",age: 1992, volumbody: 10, windows: .close, engin: .stop, body: .bagagnik, volumenew: 100, kuz: .t100)
print(trunkauto.getInfo()) 
trunkauto.pogruzka()
print(trunkauto.getInfo()) 
