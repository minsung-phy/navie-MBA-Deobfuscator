
(set-logic BV)

(define-fun obfuscated ((x (BitVec 64)) (y (BitVec 64))) (BitVec 64) 
  (bvadd #x0000000000000001 t)
)

(synth-fun deobfuscated ((x (BitVec 64)) (y (BitVec 64))) (BitVec 64) 
  (
    (Start (BitVec 64)
        (
          (bvnot Start)
          (bvxor Start Start)
          (bvand Start Start)
          (bvor Start Start)
          (bvneg Start)
          (bvadd Start Start)
          (bvmul Start Start)
          (bvsub Start Start)
          (bvshl Start Start)
          (bvsdiv Start Start)
          (bvsrem Start Start)
          (bvlshr Start Start)
           x y
           #x0000000000000000 #x0000000000000001 #x0000000000000002 #x0000000000000004 #x0000000000000008 #x0000000200000000 
        )
      )
  )
)

(declare-var x (BitVec 64)) 
(declare-var y (BitVec 64))

(constraint (= (obfuscated x y) (deobfuscated x y)))
(check-synth)
