// You are given an operation that implements a single-qubit unitary transformation: either the Z gate or the -Z gate (i.e., the −|0⟩⟨0|+|1⟩⟨1| gate: (−Z)(α|0⟩+β|1⟩)=−α|0⟩+β|1⟩). The operation will have Adjoint and Controlled variants defined.

// Your task is to perform necessary operations and measurements to figure out which unitary it was and to return 0 if it was the Z gate or 1 if it was the -Z gate.

// You are allowed to apply the given operation and its adjoint/controlled variants exactly once.

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