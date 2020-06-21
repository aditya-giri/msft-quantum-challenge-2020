namespace Solution {

    open Microsoft.Quantum.Intrinsic;

    operation Solve_c1 (qs : Qubit[]) : Unit {
        using (q = Qubit()) {
            mutable fin = false;
            for (qb in qs) {
                H(qb);
            }  
            repeat {
                Controlled X(qs, q);
                let res = M(q);
            }
            until (fin)
            fixup {
                if (res == Zero) {
                    set fin = true;
                }
                else {
                    X(q);
                    for (qb in qs) {
                        X(qb);
                        H(qb);
                    }   
                }
            }
            Reset(q);
        }
    }
}