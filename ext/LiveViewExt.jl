module LiveViewExt
using LabPressureController
using WGLMakie, Bonito

function LabPressureController.live_view(server::Server)
  app = App() do
    f = Figure()
    ax = Axis(f[1,1])
    lines!(ax, 1:10)
    return Grid(Card(f))
  end
  route!(server, "/pressure" => app)
end
end
