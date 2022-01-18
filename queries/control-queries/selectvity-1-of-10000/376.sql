select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 598 and ss.ss_hash <= 698 and i.i_hash >= 968 and i.i_hash <= 988 and hd.hd_hash >= 947 and hd.hd_hash <= 997
;
