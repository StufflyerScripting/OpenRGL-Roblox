local screen = {}

function screen.CreateScreen(width: number, height: number, pixel_size, color: Color3, screen: Folder)
	local HEIGHT = height
	local WIDTH = width
	local Screen = workspace:FindFirstChild("Screen")

	for y = 1, HEIGHT do
		for x = 1, WIDTH do
			local pixel = Instance.new("Part", Screen)
			pixel.Size = Vector3.new(pixel_size, pixel_size, pixel_size)
			pixel.Anchored = true
			pixel.Name = x.."_"..y
			pixel.Color = color
			pixel.CastShadow = false
			pixel.Material = Enum.Material.SmoothPlastic

			pixel.Position = Vector3.new(x * pixel_size, y * pixel_size, 10)
		end
	end

end


return screen
