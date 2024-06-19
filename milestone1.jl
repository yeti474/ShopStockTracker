mutable struct Store
    stock::Dict
    prices::Dict
    funds::Float64
end

stock = Dict("milk"=>10,"egg"=>20,"cheese"=>35,"bread"=>20,"chocolate"=>22,"flour"=>15,"tomato"=>15)
prices = Dict("milk"=>1,"egg"=>2,"cheese"=>3.5,"bread"=>.9,"chocolate"=>2.2,"flour"=>.5,"tomato"=>1.5)

store = Store(stock,prices,100.00)

println("The number of units of milk in stock is: ",store.stock["milk"])
println("The price of 1 unit of tomato is: \$", store.prices["tomato"])

items = ["cheese","chocolate","flour"]
println("The money needed to buy all cheese, chocolate, and flour in stock is: \$",sum([store.stock[i]*store.prices[i] for i in items]))