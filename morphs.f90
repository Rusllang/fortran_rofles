program test
    use polymorph
    class(shape), allocatable :: s

    allocate(circle::s) 

    select type (s)
    type is (circle)
    s%radius = 5

    end select
    call s%print()
    print *, s%area()
end program test