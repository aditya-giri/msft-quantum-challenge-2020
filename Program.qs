
namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation TestSolve() : Int {
        
        return Solve_a1(Z);

        // return Solve_a2(Z); // to test A2

        // return Solve_a3(Z); // to test A3

        // return Solve_a4(X); // to test A4

        // return Solve_a4(Z); // to test A5

        // using (q = Qubit[3]) { // to test B1
        //     X(q[0]);
        //     Solve_b1(q);
        //     Reset(q);
        // }

        // using (q = Qubit[3]) { // to test B2
        //     X(q[1]);
        //     Solve_b1(q);
        //     Reset(q);
        // } 

        // using (q = Qubit[2]) { // to Test C => result should always be 1, 2, or 3 and each should be equally probable
        //     Solve_c(q);
        //     let res = ResultArrayAsInt(MultiM(q));
        //     ResetAll(q);
        //     return res;
        // }

    }
}