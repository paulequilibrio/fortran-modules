program fruit_driver
  use fruit
  use string_test
  call init_fruit

  call test_string_btrim

  call fruit_summary
  call fruit_finalize
end program fruit_driver
