module LabPressureController


export PressureController

export set_pressure, cur_pressure, scale, set_pid, get_pid

struct PressureController{T}
  device::T
end

function drop_previous_input(p::PressureController)
  while bytesavailable(p.device) > 0
    read(p.device)
  end
end

function set_pressure(p::PressureController)
  drop_previous_input(p)
  write(p.device, "PRE:SET?\n")
  parse(Int, readline(p.device))
end

function set_pressure(p::PressureController, pressure)
  drop_previous_input(p)
  write(p.device, "PRE:SET $pressure\n")
  return nothing
end

function cur_pressure(p::PressureController)
  drop_previous_input(p)
  write(p.device, "PRE:CUR?\n")
  parse(Int, readline(p.device))
end

function scale(p::PressureController)
  drop_previous_input(p)
  write(p.device, "SYST:PRE:SCAL?\n")
  parse(Float64, readline(p.device))
end

function scale(p::PressureController, scale)
  drop_previous_input(p)
  write(p.device, "SYST:PRE:SCAL $scale\n")
  nothing
end

function get_pid(pc::PressureController)
  drop_previous_input(pc)
  write(pc.device, "SYST:PID:P?\n")
  p = parse(Float64, readline(pc.device))
  write(pc.device, "SYST:PID:I?\n")
  i = parse(Float64, readline(pc.device))
  write(pc.device, "SYST:PID:D?\n")
  d = parse(Float64, readline(pc.device))
  return (P = p, I = i, D = d)
end

function set_pid(pc::PressureController; 
                 P = nothing,
                 I = nothing,
                 D = nothing
                 )
  if !isnothing(P)
    write(pc.device, "SYST:PID:P $P\n")
  end
  if !isnothing(I)
    write(pc.device, "SYST:PID:I $I\n")
  end
  if !isnothing(D)
    write(pc.device, "SYST:PID:D $D\n")
  end

end

export live_view
live_view() = error("Load WGLMakie")

end
