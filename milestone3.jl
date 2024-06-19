include("milestone2.jl")

function is_available(store::Store,item::String,qty::Int64)
    if haskey(store.stock,item)
        if store.stock[item] >= qty
            true
        else
            println("Sorry, we don't have $item in those quantities")
        end
    else
        println("Sorry, we don't sell $item at this store")
    end
end

function sell!(store::Store,item_list::Array)
    for i in item_list
        if is_available(store,i,1) == true
            store.funds += store.prices[i]
            store.stock[i] -= 1
        end
    end
    println("The store now has: \$", store.funds)
end

sell!(store,["egg","foo","bread","bread","egg","bread"])

function sell!(store::Store,item_dict::Dict)
    for (k,v) in item_dict
        if is_available(store,k,v) == true
            store.funds += store.prices[k]*v
            store.stock[k] -= v
        end
    end
    println("The store now has: \$", store.funds)
end

sell!(store,Dict("tomato"=>1,"foz"=>3))