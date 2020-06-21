namespace Solution {

    open Microsoft.Quantum.Intrinsic;
  
    operation Solve_a1 (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using (q = Qubit[2]) {
            X(q[0]);
            unitary(q);
            mutable res = 0;
            let m = M(q[1]);
            if (m == Zero) {
                set res = 1;
            }
            ResetAll(q);
            return res;
        }
    }
}

