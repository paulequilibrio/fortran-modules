module string
  implicit none

contains

  module function btrim(string) result(trimed)
    character(len=*), intent(in) :: string
    character(len=:), allocatable :: trimed
    trimed = trim(adjustl(string))
  end function btrim

  module function string_count_fields(string, optional_delimiter) result(count)
    character(len=*), intent(in) :: string
    character(len=*), intent(in), optional :: optional_delimiter
    character(len=:), allocatable :: delimiter
    integer :: count, cursor, delimiter_position, delimiter_length

    if (present(optional_delimiter)) then
      delimiter = optional_delimiter
    else
      delimiter = ','
    end if

    delimiter_length = len(delimiter)
    count = 0
    cursor = 1

    do
      count = count + 1
      delimiter_position = index(string(cursor:), delimiter)
      cursor = (cursor - 1) + delimiter_position + delimiter_length
      if (delimiter_position == 0 .or. len(delimiter) == 0) exit
    end do
  end function string_count_fields

end module string
