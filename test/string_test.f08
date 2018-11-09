module string_test
  use fruit

contains

  subroutine test_string_btrim
    use string, only: btrim
    character(len=:), allocatable :: output
    output = btrim('  ab cd  ')
    call assert_equals('ab cd', output)
    call assert_equals(5, len(output))
  end subroutine test_string_btrim

  subroutine test_string_count_fields
    use string, only: string_count_fields
    integer :: count
    count = string_count_fields('ab', ',')
    call assert_equals(1, count)
    count = string_count_fields('ab', '')
    call assert_equals(1, count)
    count = string_count_fields('a b', ' ')
    call assert_equals(2, count)
    count = string_count_fields(',a,', ',')
    call assert_equals(3, count)
    count = string_count_fields('>a<b><c>', '><')
    call assert_equals(2, count)
    count = string_count_fields('a;;;b;;;c;d;;;e', ';;;')
    call assert_equals(4, count)
    count = string_count_fields('a,b,c,d,e')
    call assert_equals(5, count)
  end subroutine test_string_count_fields

end module string_test
