import HelpersLib.PReal.Basic

theorem mul_mul_comm_last_first (a b c : ℝ>0) : a*b*c = c*b*a := by
  rw [mul_assoc, mul_comm b c, ←mul_assoc, mul_comm a c, mul_assoc, mul_comm a b, ←mul_assoc]

theorem mul_mul_comm_last_second (a b c : ℝ>0) : a*b*c = a*c*b := by
  rw [mul_assoc, mul_comm b c, ←mul_assoc]

theorem mul_mul_mul_comm_last_first (a b c d: ℝ>0) : a*b*c*d = d*b*c*a := by
  rw [mul_assoc, mul_assoc, ← mul_assoc b]
  rw [mul_mul_comm_last_first]
  rw [mul_assoc, ←mul_assoc, mul_comm a d]
  rw [mul_assoc, ←mul_assoc a, mul_mul_comm_last_first]
  rw [mul_assoc, ←mul_assoc, ←mul_assoc]

theorem mul_mul_mul_comm_third_first (a b c d: ℝ>0) : a*b*c*d = c*b*a*d := by
  simp
  rw [mul_assoc, mul_comm, mul_comm c b]

theorem mul_mul_mul_comm_third_second (a b c d: ℝ>0) : a*b*c*d = a*c*b*d := by
  simp
  rw [mul_assoc, mul_comm b c, ←mul_assoc]
