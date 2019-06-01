program main
  use FFTW3
  implicit none

  integer, parameter :: n = 1024
  integer :: i

  real(c_double), allocatable :: noised_data_in(:)
  complex(c_double_complex), allocatable :: noised_data_out(:)

  type(c_ptr) :: plan_noise_f, plan_noise_b

  real(16), parameter :: pi = 4 * atan(1.0_16)
  real(16) :: t = 0.0
  real(16) :: dt = 1 / real(n - 1)
  real(16) :: val
  real(16) :: random_noise

  allocate(noised_data_in(n))

  allocate(noised_data_out(n/2+1))

  do i=1,n
      t = t + dt
      call random_number(random_noise)
      noised_data_in(i) = cos(2 * pi * t * 5) + (random_noise * 2 - 1) * 0.1
  end do

  plan_noise_f = fftw_plan_dft_r2c_1d(size(noised_data_in), noised_data_in, noised_data_out, FFTW_ESTIMATE+FFTW_UNALIGNED)
  plan_noise_b = fftw_plan_dft_c2r_1d(size(noised_data_in), noised_data_out, noised_data_in, FFTW_ESTIMATE+FFTW_UNALIGNED)

  open(19, file='res/noised_cos', status='unknown')

  t = 0.0
  do i=1,size(noised_data_in)
      t = t + dt
      val = noised_data_in(i)
      if(val /= val) val = 0.0
      write(19, '(F15.10,  F15.10)') t, val
  end do
  close(19)

  call fftw_execute_dft_r2c(plan_noise_f, noised_data_in, noised_data_out)

  open(19, file='res/noised_cos_fft', status='unknown')

  do i=1,size(noised_data_out)
      val = abs(noised_data_out(i))
      if(val /= val) val = 0.0
      write(19, '(I15,  F15.10)') i, val
  end do
  close(19)

  open(19, file='res/filtered_cos_fft', status='unknown')

  do i=1,size(noised_data_out)
      if(abs(noised_data_out(i)) /= abs(noised_data_out(i))) noised_data_out(i) = (0.0, 0.0)
      if(abs(noised_data_out(i)) < 50) noised_data_out(i) = (0.0, 0.0)

      val = noised_data_out(i)

      write(19, '(I15,  F15.10)') i, val
  end do
  close(19)

  call fftw_execute_dft_c2r(plan_noise_b, noised_data_out, noised_data_in)

  open(19, file='res/filtered_cos', status='unknown')

  t = 0.0
  do i=1,size(noised_data_in)
      t = t + dt
      val = noised_data_in(i) / size(noised_data_in)
      if(val /= val) val = 0.0
      write(19, '(F15.10,     F20.10)') t, val
  end do
  close(19)

  call fftw_destroy_plan(plan_noise_f)

  call fftw_destroy_plan(plan_noise_b)

  deallocate(noised_data_in)

  deallocate(noised_data_out)
end program