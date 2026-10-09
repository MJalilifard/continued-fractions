function PeriodicRational(n::Int,d::Int)
    local MyNumber = BigFloat(n)/BigFloat(d)
    local Decimals = []
    for i in 1:20
        Floor = Int(round(MyNumber,RoundDown))
        push!(Decimals,Floor)
        if Floor in Decimals[1:i-1]
            break
        end
        MyNumber = 10*(MyNumber - Floor)
    end
    local a
    for j in 1:length(Decimals)-1
        if Decimals[j] == Decimals[end]
            a = j
        end
    end
    return Decimals[a:end-1]
end

# using method

# a = PeriodicRational(22,7)