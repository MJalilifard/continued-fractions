using Latexify

# Computing Continued Fraction Indices

function ContinuedFraction(x::Number,n::Int)
    global theNumber = BigFloat(x)
    global indices = []
        
    for i in 1:n
        push!(indices,Int64((round(theNumber,RoundDown)))) #putting integer part of number in the array
        if theNumber - round(theNumber,RoundDown) > 1e-12
            theNumber = 1 / (theNumber - round(theNumber,RoundDown))
        else theNumber = 0   
            break
        end
    end
    return indices
end


# Exact indices of 3 examples

rad19 = [4, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1, 3, 1, 2, 8, 2, 1];
euler = [2, 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 1, 1, 10, 1, 1, 12, 1, 1, 14, 1, 1, 16, 1, 1, 18, 1, 1, 20, 1, 1, 22, 1, 1, 24, 1, 1, 26, 1, 1, 28, 1, 1, 30, 1, 1, 32, 1, 1, 34, 1, 1, 36, 1, 1, 38, 1, 1, 40, 1, 1, 42, 1, 1, 44, 1, 1, 46, 1, 1, 48, 1, 1, 50, 1, 1, 52, 1, 1, 54, 1, 1, 56, 1, 1, 58, 1, 1, 60, 1, 1, 62, 1, 1, 64, 1, 1, 66];
pi2 = [3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1];


# Checking the precision of ContinuedFraction function

# println(ContinuedFraction(π,70))
# println(indices==pi2[1:70])

# Show latex

function LTX(I::Vector,last=length(I))
    firstInt = "$(I[1])"
    middle = ""
    parentheses = ""
    for i in 2:last
        middle = middle*"+1/($(I[i])"
    end
    for i in 2:last
        parentheses = parentheses*")"
    end
    stickTogether = latexify(firstInt*middle*parentheses)
    return stickTogether
end

# LTX(ContinuedFraction(sqrt(23),20))


# Check if the CF is periodic

function checkPeriodLengthL(n,l)    
    local repeatedArrays = []
    local repeat = true
    for i in 1:(length(n)-(2*l-1))
        repeatedArrays = n[i:i+l-1]
        repeat = true
        for j in i+l:l:length(n)-l+1
            if n[j:j+l-1] != repeatedArrays
                repeat = false
                break
            end
        end
    end
    if repeat
            return repeatedArrays
        else
            println("nothing repeat")
        end
end