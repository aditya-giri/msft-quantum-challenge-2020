namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve_a2 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (qb = Qubit()) {
            H(qb);
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