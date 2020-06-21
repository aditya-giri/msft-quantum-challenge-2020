namespace Solution {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    operation Solve_a5 (theta : Double, unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable multiple_of_pi = Truncate(theta*1000.0/PI());
        mutable num = 1000;
        if (multiple_of_pi % 2 == 0) {
            set num = 1001;
        }
        mutable res = 0;
        using (q = Qubit()) {
            for (index in 0 .. num-1) {
                unitary(q);
            }
            let m = M(q);
            if (m == One) {
                set res = 1;
            }
            Reset(q);
            return res;
        }
    }
}