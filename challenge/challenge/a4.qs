namespace Solution {

    open Microsoft.Quantum.Intrinsic;

    operation Solve_a4 (unitary : ((Double, Qubit) => Unit is Adj+Ctl)) : Int {
        using (q = Qubit[2]) {
            H(q[0]);
            Controlled unitary([q[0]], (2.0*PI(), q[1]));
            H(q[0]);
            mutable res = 0;
            let m = M(q[0]);
            if (m == Zero){
                set res = 1;
            }
            ResetAll(q);
            return res;
        }
    }
}