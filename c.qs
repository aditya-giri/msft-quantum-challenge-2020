namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Measurement;

    operation Solve_c (qs : Qubit[]) : Unit {
        using (q = Qubit()) {
            mutable fin = false;
            repeat {
                X(qs[0]);
                X(qs[1]);
                CCNOT(qs[0], qs[1], q);
                X(qs[0]);
                X(qs[1]);

                let res = M(q);
            }
            until (fin)
            fixup {
                if (res == Zero) {
                    set fin = true;
                }
                else {
                    H(qs[0]);
                    H(qs[1]);
                    X(q);
                }
            }
            Reset(q);
        }
    }
}