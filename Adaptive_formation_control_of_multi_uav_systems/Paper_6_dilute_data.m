
function output_data = Paper_6_dilute_data(input_data, dilute_time)

a = size(input_data, 1);
b = size(input_data, 2);

output_data = zeros((a-1)/dilute_time+1,b);

for i = 1 : (a-1)/dilute_time+1
    for j = 1 : b
        output_data(i,j) = input_data((i-1) * dilute_time + 1, j);
    end
end

end

