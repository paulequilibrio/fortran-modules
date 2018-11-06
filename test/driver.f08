program fruit_driver
  use fruit
  use string_test
  use cli_test
  call init_fruit

  call test_string_btrim
  call test_cli_get_argument
  call test_cli_get_option_value

  call fruit_summary
  call fruit_finalize
end program fruit_driver
