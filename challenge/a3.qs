namespace Solution {

    open Microsoft.Quantum.Intrinsic;

    operation Solve_a3 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (q = Qubit()) {
            unitary(q);
            Z(q);
            unitary(q);
            mutable res = 0;
            let m = M(q);
            if (m == Zero) {
                set res = 1;
            }
            Reset(q);
            return res;
        }
    }
}