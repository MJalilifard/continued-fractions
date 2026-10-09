function permute_right(a)
    a_copy = copy(a)
    moved_a = zeros(Int64,length(a))
    for i in 1:(length(a)-1)
        moved_a[i+1] = a_copy[i]
    end
    moved_a[1] = a_copy[end]
    return moved_a
end

function perms(a)
    global all_perms = []
    for i in 1:(length(a))
        push!(all_perms, permute_right(a))
        a = permute_right(a)
    end
    return all_perms
end

# using method

# allPermute([1,5,9,7,5,9])