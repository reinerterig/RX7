
-- initialize an empty array to hold the presets
presets = {}

-- open the file for reading
local file = io.open("/home/we/dust/code/RX7/lib/DX7-presets.txt", "r")

-- loop through each line of the file
for line in file:lines() do
  -- split the line using "," as the delimiter
  local data = {}
  for value in line:gmatch("[^,]+") do
    table.insert(data, value)
  end

  -- create a new preset object and add it to the presets array
  local preset = {index = tonumber(data[1]), bank = data[2], number = tonumber(data[3]), name = data[4]}
  table.insert(presets, preset)
end

-- close the file
file:close()

-- function to get a specific preset from the presets array
function get_preset(preset_index)
  return presets[preset_index]
end

-- return the presets table
return {presets = presets, get_preset = get_preset}

-- function to print a specific preset from the presets array
function print_preset(preset_index)
  print("Index:\t" .. presets[preset_index].index)
  print("Bank:\t" .. presets[preset_index].bank)
  print("Number:\t" .. presets[preset_index].number)
  print("Name:\t" .. presets[preset_index].name)
end
