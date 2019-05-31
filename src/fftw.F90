module FFTW3
  use, intrinsic :: iso_c_binding
  include "fftw3.f03"
end module
       
    use FFTW3
    implicit none

    integer, parameter :: n = 1000
    integer :: i

    real(c_double), allocatable :: data_in(:)
    complex(c_double_complex), allocatable :: data_out(:)
    type(c_ptr) :: planf, planb
    real(16), parameter :: pi = 4 * atan(1.0_16)
    real(16) :: t = 0.0
    real(16) :: dt = 1 / real(n - 1)
    real(16) :: val

    allocate(data_in(n))
    allocate(data_out(n/2+1))

    do i=1,n+1
        t = t + dt
        data_in(i) = sin(2 * pi * t * 200) + 2 * sin(2 * pi * t * 400)
    end do

    planf = fftw_plan_dft_r2c_1d(size(data_in), data_in, data_out, FFTW_ESTIMATE+FFTW_UNALIGNED)
    planb = fftw_plan_dft_c2r_1d(size(data_in), data_out, data_in, FFTW_ESTIMATE+FFTW_UNALIGNED)

    print *, "real input:", real(data_in)

    call fftw_execute_dft_r2c(planf, data_in, data_out)

    print *, "result real part:", real(data_out)

    open(19, file='../res/real_out', status='new')
    t = 0.0
    do i=1,n+1
        t = t + dt
        val = abs(real(data_out(i), 16))
        if(val /= val) val = 0.0
        write(19, '(F15.8, F15.8)') t , val
    end do
    close(19)

    print *, "result imaginary part:", aimag(data_out)

    call fftw_execute_dft_c2r(planb, data_out, data_in)
    
    print *, "real output:", real(data_in)/n

    call fftw_destroy_plan(planf)
    call fftw_destroy_plan(planb)
end