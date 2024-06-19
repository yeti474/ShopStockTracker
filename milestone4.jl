include("milestone3.jl")

function give_change(price,given)
    bank_notes = [100.00,50.00,20.00,10.00,5.00,1.00,.25,.10,.05,.01]
    if given < .01
        println("Sorry, you must give at least a penny")
    elseif typeof(price) == Float64 && length(split(string(price),".")[2])>2
        println("Oopsie, looks like I gave you a price that inclues partial pennies")
    elseif typeof(given) == Float64 && length(split(string(given),".")[2])>2 
        println("Sorry, you cannot give partial pennies")
    elseif given < price
        remaining_due = round(price-given,digits=2)
        println("Sorry, you still owe \$$remaining_due")
    else
        change = round(given-price,digits=2)
        println("Change due: \$$change")
        change_due = []
        cnt = 1
        while change > 0
            push!(change_due, Int(floor(change/bank_notes[cnt])))
            change -= floor(change/bank_notes[cnt])*bank_notes[cnt]
            cnt += 1
            if cnt == 11
                break
            end
        end
        tender = [string(change_due[i]," x ", string(bank_notes[i])) for i in 1:length(bank_notes)]
        return println(tender)
    end
end


give_change(100,120.32)
give_change(1000,120.32)
give_change(100.4321,120.32)
give_change(100,120.321)