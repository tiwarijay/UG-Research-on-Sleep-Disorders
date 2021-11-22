load('n1_F4C4_all')
load('n2_F4C4_all')
load('n3_F4C4_all')
load('n4_F4C4_all')
load('n5_F4C4_all')
load('n8_F4C4_all')
load('n10_F4C4_all')
load('n11_F4C4_all')
load('n16_F4C4_all')

temp = [n1_F4C4_all; n2_F4C4_all; n3_F4C4_all; n4_F4C4_all; n5_F4C4_all; n8_F4C4_all; n10_F4C4_all; n11_F4C4_all; n16_F4C4_all];
save(all_F4C4_combined,'temp')
