namespace Solution {

    open Microsoft.Quantum.Intrinsic;

    operation Solve_c2 (qs : Qubit[], parity : Int) : Unit {
        using (q = Qubit()) {
            mutable fin = false;
            for (qb in qs) {
                H(qb);
            }  
            repeat {
                for (qb in qs)
                {
                    CNOT(qb, q);
                }
                let res = M(q);
            }
            until (fin)
            fixup {
                if ((res == Zero and parity == 0) or (res == One and parity == 1)) {
                    set fin = true;
                }
                else {
                    Reset(q);
                    ResetAll(qs);
                    for (qb in qs){
                        H(qb);
                    }  
                }
            }
            Reset(q);
        }
    }
}