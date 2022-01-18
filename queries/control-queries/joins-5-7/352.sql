select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 388 and i.i_hash <= 788 and c.c_hash >= 629 and c.c_hash <= 962 and hd.hd_hash >= 3 and hd.hd_hash <= 753
;
