// You are given an operation that implements a single-qubit unitary transformation: either the identity (I gate) or the X gate. The operation will have Adjoint and Controlled variants defined.

// Your task is to perform necessary operations and measurements to figure out which unitary it was and to return 0 if it was the I gate or 1 if it was the X gate.

// You are allowed to apply the given operation and its adjoint/controlled variants exactly once.

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