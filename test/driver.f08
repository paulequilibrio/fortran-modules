program fruit_driver
  use fruit
  use string_test
  use cli_test
  use file_test
  call init_fruit

  call test_string_btrim
  call test_string_count_fields
  call test_cli_get_argument
  call test_cli_get_option_value
  call test_file_already_exist
  call test_file_already_open
  call test_file_is_readable
  call test_file_is_writable

  call fruit_summary
  call fruit_finalize
end program fruit_driver
