(module
    (func $fib64
        (param $n i64)
        (result i64)

        (if
            (result i64)
            ;; if $n <= 1
            (i64.le_s
                (get_local $n)
                (i64.const 1)
            )
            ;; then return 1
            (then
                (i64.const 1)
            )
            ;; else return fib(n - 1) + fib(n - 2)
            (else
                (i64.add
                    (call $fib64
                        (i64.sub
                            (get_local $n)
                            (i64.const 1)
                        )
                    )
                    (call $fib64
                        (i64.sub
                            (get_local $n)
                            (i64.const 2)
                        )
                    )
                )
            )
        )
    )
    ;; nodejs does not support i64 yet. As a workaround, we accept i32
    ;; and return f64 instead.
    (func $fib
        (export "fib")
        (param $n i32)
        (result f64)
        (f64.convert_u/i64
            (call $fib64
                (i64.extend_s/i32 (get_local $n))
            )
        )
    )
)

