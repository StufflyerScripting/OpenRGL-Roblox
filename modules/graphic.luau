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

function gl.DrawCircle(x0: number, y0: number, radius: number, color: Color3, screen: Folder)
    local x = 0
    local y = radius
    local d = 3 - 2 * radius
    
    while x <= y do
        gl.PlotPixel(x0 + x, y0 + y, true, color, screen)  -- Quadrant 1
        gl.PlotPixel(x0 - x, y0 + y, true, color, screen)  -- Quadrant 2
        gl.PlotPixel(x0 + x, y0 - y, true, color, screen)  -- Quadrant 3
        gl.PlotPixel(x0 - x, y0 - y, true, color, screen)  -- Quadrant 4
        gl.PlotPixel(x0 + y, y0 + x, true, color, screen)  -- Quadrant 5
        gl.PlotPixel(x0 - y, y0 + x, true, color, screen)  -- Quadrant 6
        gl.PlotPixel(x0 + y, y0 - x, true, color, screen)  -- Quadrant 7
        gl.PlotPixel(x0 - y, y0 - x, true, color, screen)  -- Quadrant 8
        
        if d < 0 then
            d = d + 4 * x + 6
        else
            d = d + 4 * (x - y) + 10
            y = y - 1
        end
        x = x + 1
    end
end

return gl
