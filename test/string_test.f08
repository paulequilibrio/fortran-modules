module string_test
  use fruit
  implicit none
  contains

  subroutine test_string_btrim
    use string, only: btrim
    character(len=:), allocatable :: output
    output = btrim('  ab cd  ')
    call assert_equals('ab cd', output)
    call assert_equals(5, len(output))
  end subroutine test_string_btrim

end module string_test
