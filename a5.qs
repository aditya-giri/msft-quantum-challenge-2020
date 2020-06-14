namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve_a5 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (qr = Qubit[2]) {
            H(qr[0]);
            Controlled unitary([qr[0]], qr[1]);
            H(qr[0]);
            mutable ret = 0;
            if (M(qr[0]) == One) {
                set ret = 1;
            }
            ResetAll(qr);
            return ret;
        }
    }
}