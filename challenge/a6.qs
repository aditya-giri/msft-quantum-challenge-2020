namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    operation Solve_a6 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable res = 0;
        using (q = Qubit()) {
            H(q);
            unitary(q);
            H(q);
            let m = M(q);
            if (m == One) {
                // we know it is Y or Z
                using (q2 = Qubit[2]) {
                    X(q2[0]);
                    Controlled unitary([q2[0]], q2[1]);
                    //measure: if 0 Z if 1 Y
                    let m2 = M(q2[1]);
                    if (m2 == Zero) {
                        set res = 3;
                    }
                    else {
                        set res = 2;
                    }
                    ResetAll(q2);
                }
            }
            else {
                // we know it is I or X
                using (q2 = Qubit()) {
                    Adjoint unitary(q2);
                    //measure: if 0 I if 1 X
                    let m2 = M(q2);
                    if (m2 == Zero) {
                        set res = 0;
                    }
                    else {
                        set res = 1;
                    }
                    Reset(q2);
                }
            }
            Reset(q);
            return res;
        }
    }
}