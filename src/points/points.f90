program test
    use classes
    implicit none
    real :: x, y, distab
    type(point) :: pA, pB
    pA%x = 1
    pA%y = 0.5
    call pA%print()
    pB%x = 0
    pB%y = 0
    call pB%print()
    distab = dist(pA, pB)
    print *, "distance between points ", distab
    x = 3
    y = 5
    call move(pB, x, y)   
    call pB%print()
    
end program test