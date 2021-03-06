def n_times(thing)
  lambda {|n| thing * n}
end

p1 = n_times(23)
p p1.call(3)
p p1.call(4)

p2 = n_times("hello")
p p2.call(3)

def power_proc_generator
  v = 1
  lambda { v += v }
end

power_proc = power_proc_generator
p power_proc.call
p power_proc.call
p power_proc.call
p power_proc.call