# MWE to generate a simple figure with slider (that move dots inside an  axis)
# both code - before and after ####### line - do the same thing

using WGLMakie, JSServe
brower_display()

function scatter3D(slider)
  v = [[1,2,3], [1,4,6], [0,5,10]]
  fig = Figure(resolution = (400, 400))
  ax3D = Axis3(fig[1, 1])
  s = slider.value
  lims = @lift((minimum(v[$s]), maximum(v[$s])))
  data = @lift(Vec3f.(v[$s], v[$s], v[$s]))
  p3D = scatter!(ax3D, data, markersize = 20, strokewidth = 2)
  xlims!(ax3D, 0, 10) 
  ylims!(ax3D, 0, 10)
  zlims!(ax3D, 0, 10)
  fig
  return fig
end

app = App() do session::Session    
	slider = JSServe.Slider(1:3)
	fig = scatter3D(slider)
	sl = DOM.div("data: ", slider, slider.value)
	return DOM.div(sl, fig)
end

#####################################

using WGLMakie, JSServe
browser_display()

function viz()
v = [[1,2,3], [1,4,6], [0,5,10]]
fig = Figure(resolution = (400, 400))
ax3D = Axis3(fig[1, 1])
sg = SliderGrid(fig[2, 1],
                (label = "sl", range = 1:1:3, startvalue = 1))
s = sg.sliders[1].value
data = @lift(Vec3f.(v[$s], v[$s], v[$s]))
p3D = scatter!(ax3D, data, markersize = 20, strokewidth = 2)
xlims!(ax3D, 0, 10) 
ylims!(ax3D, 0, 10)
zlims!(ax3D, 0, 10)
return fig
end

fig = viz()


