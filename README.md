Community member maintained yotta target for the NXP LPC111x device family using GCC 

FIXME: currently the linker script hard codes **32K flash** and **4K ram** and does not provide an easy way to support the different memory sizes within the LPC111x family as documented in table 2 of the [data sheet](http://www.nxp.com/documents/data_sheet/LPC111X.pdf)
