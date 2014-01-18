dofile('PN_data.lua')
dofile('PN_functions.lua')

function get_node(hour, typ)
	local node = nil
	if typ == 0 then
		node = nodes_B
	elseif typ == 1 then
		node = nodes_M
	end

	local d = nil
	for node_id, data in pairs(node) do
		if data.start >= hour and data.start <= (hour+3) then
			d = data
			break;
		end
	end
	return d
end

-- print(nodes_B[4].zone)
n = get_node(13, 1)
vardump(n)
vardump(n.slots)
-- print(n.zone)

