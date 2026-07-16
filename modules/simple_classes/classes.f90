module classes
    implicit none
    type :: point
        real :: x, y
    contains
    procedure :: print => pprint_point
    procedure :: dist
    procedure :: move
    end type

    type, extends(point) :: circle
        real :: radius
    contains
    procedure :: print => pprint_circle
    procedure :: square
    procedure :: length
    procedure :: containing
    end type
contains
    subroutine pprint_point(self)
        class(point), intent(in) :: self
        print *, "coordinates of point", self%x, self%y
    end subroutine pprint_point

    subroutine pprint_circle(self)
        class(circle), intent(in) :: self
        print *, "center of circle - ", self%x, " : ", self%y
        print *, "radius - ", self%radius
    end subroutine pprint_circle

    function dist(p1, p2) result(res)
        implicit none
        class(point), intent(in) :: p1, p2
        real :: res
        res = sqrt((p1%x - p2%x)**2 + (p2%y - p1%y)**2)
    end function dist

    subroutine move(p, xmove, ymove)
        class(point), intent(inout) :: p
        real, intent(in) :: xmove, ymove
        p%x = p%x + xmove
        p%y = p%y + ymove
    end subroutine move

    function square(self) result(sq)
        class(circle), intent (inout) :: self
        real sq, pi
        pi = 3.1415
        sq = pi * self%radius**2
    end function square    
    
    function length(self) result(l)
        class(circle), intent (inout) :: self
        real l, pi
        pi = 3.1415
        l = pi * self%radius * 2
    end function length    
    
    function containing(self, cpoint) result(ans)
        class(circle), intent(in) :: self
        class(point), intent(in) :: cpoint
        logical :: ans
        ans = sqrt( (self%x - cpoint%x)**2 + (self%y - cpoint%y)**2) <= self%radius
    end function containing
            
end module classes

module polymorph
    implicit none
    type, abstract :: shape
        character(len=20) :: color
    contains
    procedure(area_interface), deferred :: area
    procedure(print_interface), deferred :: print
    end type

    abstract interface
        function area_interface(self) result(res)
            import shape
            class(shape), intent(in) :: self
            real :: res
        end function

        subroutine print_interface(self)
            import shape
            class(shape), intent(in) :: self
        end subroutine

    end interface

    type, extends(shape) :: rectangle
        real :: width, height
    contains
    procedure :: area => per_rect
    procedure :: print => print_rect
    end type

    type, extends(shape) :: circle
        real :: radius
    contains
    procedure :: area => per_circle
    procedure :: print => print_circle
    end type
    
    type, extends(shape) :: triangle
        real :: ffold, sfold, tfold 
    contains
    procedure :: area => per_tri
    procedure :: print => print_tri
    end type

contains
    function per_rect(self) result(res)
        class(rectangle), intent(in) :: self
        real :: res
        res = (self%width + self%height)*2
    end function per_rect

    function per_circle(self) result(res)
        class(circle), intent(in) :: self
        real :: res
        res = 3.1415 * self%radius**2
    end function per_circle

    function per_tri(self) result(res)
        class(triangle), intent(in) :: self
        real :: res, p
        p = (self%ffold + self%sfold + self%tfold) / 2
        res = sqrt(p * (p-self%ffold) * (p-self%sfold) * (p-self%tfold))
    end function per_tri

    subroutine print_rect(self)
        class(rectangle), intent(in) :: self
        print *, self%width, self%height
    end subroutine

    subroutine print_circle(self)
        class(circle), intent(in) :: self
        print *, self%radius
    end subroutine

    subroutine print_tri(self)
        class(triangle), intent(in) :: self
        print *, self%ffold, self%sfold, self%tfold
    end subroutine
end module polymorph