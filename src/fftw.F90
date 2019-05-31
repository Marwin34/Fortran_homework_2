program main
  use FFTW3
  implicit none

  integer, parameter :: n = 1024
  integer :: i

  real(c_double), allocatable :: data_in(:)
  complex(c_double_complex), allocatable :: data_out(:)

  type(c_ptr) :: plan_f

  real(16), parameter :: pi = 4 * atan(1.0_16)
  real(16) :: t = 0.0
  real(16) :: dt = 1 / real(n - 1)
  real(16) :: val

  allocate(data_in(n))

  allocate(data_out(n/2+1))

  do i=1,n
      t = t + dt
      data_in(i) = sin(2 * pi * t * 200) + 2 * sin(2 * pi * t * 400)
  end do

  plan_f = fftw_plan_dft_r2c_1d(size(data_in), data_in, data_out, FFTW_ESTIMATE+FFTW_UNALIGNED)

  call fftw_execute_dft_r2c(plan_f, data_in, data_out)

  open(19, file='../res/fft_out', status='unknown')

  do i=1,size(data_out)
      val = abs(data_out(i))
      if(val /= val) val = 0.0
      write(19, '(I15,  F15.10)') i, val
  end do
  close(19)

  call fftw_destroy_plan(plan_f)

  deallocate(data_in)

  deallocate(data_out)
end program