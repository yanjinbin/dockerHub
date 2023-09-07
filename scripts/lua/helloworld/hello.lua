print("hello lua")
print(type(true))
print(type(1))
print(type(nil))

local corp = {
    web = "www.google.com", --索引为字符串，key = "web",
    telephone = "12345678", --索引为字符串
    staff = { "Jack", "Scott", "Gary" }, --索引为字符串，值也是一个表
    100876, --相当于 [1] = 100876，此时索引为数字
    100191, --相当于 [2] = 100191，此时索引为数字
    [10] = 360, --直接把数字索引给出
    ["city"] = "Beijing" --索引为字符串
}

print(corp.web)               -->output:www.google.com
print(corp["telephone"])      -->output:12345678
print(corp[2])                -->output:100191
print(corp["city"])           -->output:"Beijing"
print(corp.staff[1])          -->output:Jack
print(corp[10])               -->output:360


local function foo(a)
    print("in the function")
    print("a = ", a)
    local x = 10
    local y = 100
    return x + y
end
local ret = foo(99)
print("ret = ", ret)

print(1 ~= 2) -- !=

local hello = function()
    print("hello world")
    if (true and false) then
        print("true")
    else
        print("false")
    end

end


-- 冒号操作会带入一个 self 参数，用来代表 自己。而点号操作，只是 内容 的展开。
-- 在函数定义时，使用冒号将默认接收一个 self 参数，而使用点号则需要显式传入 self 参数。

local str = "abcde"
print("case 1:", str:sub(1, 2))
print("case 2:", str.sub(str, 1, 2))