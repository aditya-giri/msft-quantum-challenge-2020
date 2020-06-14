// Implement a unitary operation on a register of N qubits that increments the number written in the register modulo 2N.

// Your operation should take a register of type LittleEndian - an array of qubits that encodes an unsigned integer in little-endian format, with the least significant bit written first (corresponding to the array element with index 0). The "output" of your solution is the state in which it left the input qubits.

// For example, if the qubits passed to your operation are in the state 12√(|11⟩+|10⟩)=12√(|3⟩+|1⟩), they should be transformed to the state 12√(|(3+1)mod22⟩+|(1+1)mod22⟩)=12√(|0⟩+|2⟩)=12√(|00⟩+|01⟩).

namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;

    operation Solve_b1 (register : LittleEndian) : Unit is Adj+Ctl {
        let n = Length(register!);
        for (target in n-1 .. -1 .. 1) {
            Controlled X(register![0 .. 1 .. target-1], register![target]);
        }
        X(register![0]);
    }
}    