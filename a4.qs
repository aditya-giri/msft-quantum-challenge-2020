// You are given an operation that implements a two-qubit unitary transformation: either I⊗X (the X gate applied to the second qubit and no effect on the first qubit) or the CNOT gate with the first qubit as control and the second qubit as target. The operation will have Adjoint and Controlled variants defined.

// Your task is to perform necessary operations and measurements to figure out which unitary it was and to return 0 if it was I⊗X or 1 if it was the CNOT gate.

// You are allowed to apply the given operation and its adjoint/controlled variants exactly once.

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