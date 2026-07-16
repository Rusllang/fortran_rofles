program test
    use classes
    implicit none
    type(circle) :: cA
    type(point)  :: p1, p2
    cA%radius = 5
    cA%x = 3
    cA%y = 4
    call cA%print()
    print *, square(cA)
    print *, length(cA)
    p1%x = 0
    p1%y = 0

    p2%x = 9
    p2%y = 3

    print *, containing(cA, p1)
    print *, containing(cA, p2)
end program test