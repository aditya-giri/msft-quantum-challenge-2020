namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve_a3 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (qb = Qubit()) {
            H(qb);
            unitary(qb);
            unitary(qb);
            H(qb);
            mutable result = 0;
            if (M(qb) == One) {
                set result = 1;
            }
            Reset(qb);
            return result;
        }
    }
}