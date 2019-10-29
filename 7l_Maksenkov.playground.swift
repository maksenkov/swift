/**

                            Online Swift Compiler.
                Code, Compile, Run and Debug Swift script online.
Write your code in this editor and press "Run" button to execute it.

*/


import Foundation

enum Windows {          // состояние окон
    case open, close
}

enum Engin {            // состояние двигателя
    case start, stop
}

enum Vmestimost {       // максимальная вместимость кузова 100т и 200т
    case t100, t200
}

enum Work {             // раоты по погрузке р20 и р50 - погрузка, g20 и g50 - разгрузка
    case p20, p50, g20, g50
}

enum PogrAutoErr: Error {
    case invalidVmestimost      // превышение вместимости кузова
    case invalidWork            // выгрузка больше чем есть невозможна
}

// ============================================================================================

class Truck {
    let marka : String
    let age : Int
    var windows : Windows
    var engin : Engin
    var volumenew : Int         // сколько погружено уже в кузов
    var kuz : Vmestimost        // вместимость кузова
    
    

    init(marka: String, age: Int,  windows: Windows, engin: Engin,  volumenew: Int, kuz: Vmestimost) {
        self.kuz = kuz
        self.marka = marka  
        self.age = age
        self.windows = windows
        self.engin = engin
        self.volumenew = volumenew
    }

    func getInfo() -> String{
        return "Марка: \(marka). Год выпуска: \(age). Окна: \(windows). Двигатель в работе: \(engin). Вместимость: \(kuz). Погружено: \(volumenew) кг."
    }
    
    func pogruzka(work: Work) throws {      // фукнция погрузки/разгрузки при помощи try/catch
        self.windows = .open
        self.engin = .stop
        let v : Int
        if kuz == .t100 {   // преобразование в int вместимости
            v = 100
        }else{
            v = 200
        }

        switch work {           // варианты погрузки и разгрузки с отслеживанием ошибок
               case .p20:
                    guard self.volumenew <= (v - 20) else {
                        throw PogrAutoErr.invalidVmestimost
                    }
                    self.volumenew += 20
                
               case .p50: 
                  guard self.volumenew <= (v - 50)  else {
                        throw PogrAutoErr.invalidVmestimost
                    }
                    self.volumenew += 50
                
               case .g20: 
                   guard self.volumenew > 20 else {
                        throw PogrAutoErr.invalidWork
                    }
                    self.volumenew -= 20
                
               case .g50: 
                  guard self.volumenew > 50 else {
                        throw PogrAutoErr.invalidWork
                    }
                    self.volumenew -= 50
                
        }
    }
    
     func rabota(work: Work) ->(rezult : Int?, PogrAutoErr?) {          // функция погрузки и разгрузки реализованная при помощи Error
        self.windows = .open
        self.engin = .stop
        let v : Int
        var rezult : Int
        if kuz == .t100 {
            v = 100
        }else{
            v = 200
        }

        switch work {
               case .p20:
                    guard self.volumenew <= (v - 20) else {
                        return (nil, PogrAutoErr.invalidVmestimost)
                    }
                    rezult = self.volumenew + 20
                    return (rezult, nil)
                
               case .p50: 
                  guard self.volumenew <= (v - 50)  else {
                        return (nil, PogrAutoErr.invalidVmestimost)
                    }
                    rezult = self.volumenew + 50
                    return (rezult, nil)
                
               case .g20: 
                   guard self.volumenew > 20 else {
                        return (nil, PogrAutoErr.invalidWork)
                    }
                    rezult = self.volumenew - 20
                    return (rezult, nil)
                
               case .g50: 
                  guard self.volumenew > 50 else {
                        return (nil, PogrAutoErr.invalidWork)
                    }
                    rezult = self.volumenew - 50
                    return (rezult, nil)
                
        }
    }
}

// ============================================================================================


var truckauto = Truck(marka: "Man",age: 1992, windows: .close, engin: .stop, volumenew: 20, kuz: .t100)

var truckauto2 = Truck(marka: "Камаз",age: 1968, windows: .close, engin: .stop, volumenew: 170, kuz: .t200)

var truckauto3 = Truck(marka: "ДонгФен",age: 2000, windows: .close, engin: .stop, volumenew: 110, kuz: .t200)

var truckauto4 = Truck(marka: "ДонгФен",age: 2000, windows: .close, engin: .stop, volumenew: 110, kuz: .t200)

// ============================================================================================
//  сдель происходит отгрузка на 50т из машины с вместимостью 100т и имеющимся грузом на 20т -> ошибка с выполнением действия
print(truckauto.getInfo()) 

        do {
            try truckauto.pogruzka(work: .g50)
        } catch PogrAutoErr.invalidVmestimost {
            print("Ошибка погрузки. больше в эту машину не погрузить. у нее предел \(truckauto.kuz)")
        } catch PogrAutoErr.invalidWork {
            print("Ошибка действия.Такое действие совершить нельзя так как машина пуста")
        }

print(truckauto.getInfo()) 

print(truckauto.rabota(work: .g50))

print("======================================================================================================================")
//  сдель происходит погрузка на 50т в машину с вместимостью 200т и имеющимся грузом на 170т -> ошибка с вместимостью
print(truckauto2.getInfo()) 

        do {
            try truckauto2.pogruzka(work: .p50)
        } catch PogrAutoErr.invalidVmestimost {
            print("Ошибка погрузки. больше в эту машину не погрузить. у нее предел \(truckauto.kuz)")
        } catch PogrAutoErr.invalidWork {
            print("Ошибка действия.Такое действие совершить нельзя так как машина пуста")
        }

print(truckauto2.getInfo()) 

print(truckauto2.rabota(work: .p50))

print("======================================================================================================================")
//  сдель происходит погразка на 50т в машину с вместимостью 200т и имеющимся грузом на 110т -> результат погрузка без ошибок
print(truckauto3.getInfo()) 

        do {
            try truckauto3.pogruzka(work: .p50)
        } catch PogrAutoErr.invalidVmestimost {
            print("Ошибка погрузки. больше в эту машину не погрузить. у нее предел \(truckauto.kuz)")
        } catch PogrAutoErr.invalidWork {
            print("Ошибка действия.Такое действие совершить нельзя так как машина пуста")
        }

print(truckauto3.getInfo()) 

print(truckauto4.rabota(work: .p50))



/*


Марка: Man. Год выпуска: 1992. Окна: close. Двигатель в работе: stop. Вместимость: t100. Погружено: 20 кг.                                                                                                                 
Ошибка действия.Такое действие совершить нельзя так как машина пуста                                                                                                                                                       
Марка: Man. Год выпуска: 1992. Окна: open. Двигатель в работе: stop. Вместимость: t100. Погружено: 20 кг.                                                                                                                  
(rezult: nil, Optional(main.PogrAutoErr.invalidWork))                                                                                                                                                                      
======================================================================================================================                                                                                                     
Марка: Камаз. Год выпуска: 1968. Окна: close. Двигатель в работе: stop. Вместимость: t200. Погружено: 170 кг.                                                                                                              
Ошибка погрузки. больше в эту машину не погрузить. у нее предел t100                                                                                                                                                       
Марка: Камаз. Год выпуска: 1968. Окна: open. Двигатель в работе: stop. Вместимость: t200. Погружено: 170 кг.                                                                                                               
(rezult: nil, Optional(main.PogrAutoErr.invalidVmestimost))                                                                                                                                                                
======================================================================================================================                                                                                                     
Марка: ДонгФен. Год выпуска: 2000. Окна: close. Двигатель в работе: stop. Вместимость: t200. Погружено: 110 кг.                                                                                                            
Марка: ДонгФен. Год выпуска: 2000. Окна: open. Двигатель в работе: stop. Вместимость: t200. Погружено: 160 кг.                                                                                                             
(rezult: Optional(160), nil)                                                                                                                                                                                               
                                                                                                                                                                                                                           
                                                                                                                                                                                                                           
...Program finished with exit code 0                                                                                                                                                                                       
Press ENTER to exit console.                                                                                                                                                                                               
                                                                                                                                                                                                                           
   */                                                                                                                                                                                                                        
                                                                                                                                                                                                                           

