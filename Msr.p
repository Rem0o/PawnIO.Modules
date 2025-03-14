#include <pawnio.inc>
#include <native.inc>
#include <ntstatus.inc>

forward msr_read_reg( in[], in_size, out[], out_size);
public msr_read_reg( in[], in_size, out[], out_size){
    if (in_size < 1)
        return STATUS_BUFFER_TOO_SMALL;
    if (out_size < 1)
        return STATUS_BUFFER_TOO_SMALL;

    new reg = in[0] & 0xFF;
    new value = 0;  
    msr_read(reg, value);

    out[0] = value;

    return STATUS_SUCCESS;
}


forward msr_write_reg( in[], in_size, out[], out_size);
public msr_write_reg( in[], in_size, out[], out_size){

    if (in_size < 2)
        return STATUS_BUFFER_TOO_SMALL;

    new reg = in[0] & 0xFF;
    new value = in[1] & 0xFF;
    msr_write(reg, value);

    return STATUS_SUCCESS;
}


main() {
    return STATUS_SUCCESS;
}
