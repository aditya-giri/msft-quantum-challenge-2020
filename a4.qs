namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve_a4 (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using (qr = Qubit[2]) {
            unitary(qr);
            mutable ret = 0;
            if (M(qr[1]) == Zero) {
                set ret = 1;
            }
            ResetAll(qr);
            return ret;
        }
    }
}