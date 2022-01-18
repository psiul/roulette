select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 196 and ss.ss_hash <= 596 and i.i_hash >= 51 and i.i_hash <= 801 and hd.hd_hash >= 658 and hd.hd_hash <= 991
;
