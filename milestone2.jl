include("milestone1.jl")


function delivery!(store::Store,item_list::Array)
    for i in item_list
        if haskey(store.stock,i)
            store.stock[i] += 1
        else
            store.stock[i] = 1
        end
    end
    println(store.stock)
end

 for (k,v) in store.stock
    store.stock[k] = 0
 end

delivery!(store,["cheese","tomato","tomato","tomato","baguette","baguette"])

function delivery!(store::Store,item_dict::Dict)
    for (k,v) in item_dict
        if haskey(store.stock,k)
            store.stock[k] += v
        else
            store.stock[k] = v
        end
    end
    println(store.stock)
end

delivery!(store,Dict("milk"=>1,"bread"=>1,"sugar"=>42))