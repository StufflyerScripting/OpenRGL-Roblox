local gl = {}

function gl.PlotPixel(x: number, y: number, lit: BoolValue, color: Color3, screen: Folder)
	local pixel = screen:FindFirstChild(x.."_"..y)
	if pixel and pixel:IsA("BasePart") then
		if lit then
			pixel.Color = color
		end
	end
end

function gl.DrawLine(x1: number, y1: number, x2: number, y2: number, color: Color3, screen: Folder)
	local dx = math.abs(x2 - x1)
	local dy = math.abs(y2 - y1)
	local sx = (x1 < x2) and 1 or -1
	local sy = (y1 < y2) and 1 or -1
	local err = dx - dy

	while true do
		gl.PlotPixel(x1, y1, true, color, screen)

		if x1 == x2 and y1 == y2 then
			break
		end
		
		local e2 = err * 2
		if e2 > -dy then
			err = err - dy
			x1 = x1 + sx
		end
		if e2 < dx then
			err = err + dx
			y1 = y1 + sy
		end
	end
end

