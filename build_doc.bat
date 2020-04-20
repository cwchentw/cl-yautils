sbcl --eval "(setf sb-impl::*default-external-format* :UTF-8)" ^
     --eval "(require \"codex\")" ^
     --eval "(codex:document :cl-yautils)" ^
     --eval "(quit)"