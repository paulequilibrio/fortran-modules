module string
implicit none
contains
  module function btrim(string) result(trimed)
    implicit none
    character(len=*), intent(in) :: string
    character(len=:), allocatable :: trimed
    ! integer :: length
    ! length = len(trim(adjustl(string)))
    ! allocate(character(length) :: trimed)
    trimed = trim(adjustl(string))
  end function btrim
end module string
