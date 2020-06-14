namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve_a1 (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (qb = Qubit()) {
            unitary(qb);
            mutable result = 0;
            if (M(qb) == One) {
                set result = 1;
            }
            Reset(qb);
            return result;
        }
    }
}