namespace Solution {

    open Microsoft.Quantum.Intrinsic;

    operation Solve_a2 (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using (q = Qubit[2]) {
            X(q[0]);
            unitary(q);
            mutable res = 0;
            let m = M(q[0]);
            if (m == Zero) {
                set res = 3;
            }
            else {
                let m2 = M(q[1]);
                if (m2 == One) {
                    set res = 1;
                }
                else {
                    X(q[1]);
                    unitary(q);
                    let m3 = M(q[0]);
                    if (m3 == Zero) {
                        set res = 2;
                    }
                }
            }
            ResetAll(q);
            return res;
        }
    }
}