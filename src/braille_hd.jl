const braille_signs = ['⠁' '⠂' '⠄' '⡀';
                              '⠈' '⠐' '⠠' '⢀']

function tobraille(a::BitArray{2})
    res = UInt16(0x2800)
    for x in 1:2, y in 1:4
        a[y, x] && (res |= UInt16(braille_signs[x,y]))
    end
    return Char(res)
end

tobraille(a::AbstractArray) = tobraille(a .> 0)

function arr2braille(arr)
    dyarr, dxarr = size(arr)
    dx = ceil(Int, dxarr/2)
    dy = ceil(Int, dyarr/4)
    a = zeros(Int, dy*4, dx*2)
    a[1:dyarr, 1:dxarr] = arr
    res = fill(Char(0x2800), (dy, dx))
    for y in 1:dy, x in 1:dx
        y1 = 1+(y-1)*4
        x1 = 1+(x-1)*2
        res[y,x] = tobraille(a[y1:y1+3, x1:x1+1])
    end
    return res
end

function update_board!(old::Array{Char}, arr::Array{Char})
    buf = IOBuffer()
    for i in findall(old .!= arr)
        y,x = Tuple(i)
        put(buf, [x, y], string(arr[y,x]))
    end
    print(String(take!(buf)))
end