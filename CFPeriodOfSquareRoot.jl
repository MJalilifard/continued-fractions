function PSQ(s::Int)
        # defining variables we need
    local m = zeros(100)
    local d = zeros(100)
    local a = zeros(100)
    local BRK = false
    if sqrt(s) in collect(1:100)
        a = [sqrt(s)]
        return Int64.(a)
    else
        # https://en.wikipedia.org/wiki/Periodic_continued_fraction#Canonical_form_and_repetend
        m[1] = 0
        d[1] = 1
        a[1] = Int(floor(sqrt(s)))
        for i in 2:90
            m[i] = d[i-1]*a[i-1]-m[i-1]
            d[i] = (s-(m[i])^2)/(d[i-1])
            a[i] = Int(floor((sqrt(s)+m[i])/(d[i])))
            #@show i,a[i],m[i],d[i]
            for j in 1:i-1
                if m[i] == m[j] && d[i] == d[j] && a[i] == a[j]
                    BRK = true
                    break
                end
            end
            if BRK
                break
            end
        end
        # removing extra zeros
        for i in 2:length(a)
            if a[i] == 0
                a = a[1:i-1]
                break
            end
        end
        # remove the last elements because it is the beginning of the period block
        a = a[1:end-1]
        return Int64.(a)
    end
end

for i in 1:99
    println("sqrt of ",i," = ",PSQ(i))
end