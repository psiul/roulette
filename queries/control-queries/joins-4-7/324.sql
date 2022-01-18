select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 543 and i.i_hash <= 876 and c.c_hash >= 66 and c.c_hash <= 816 and hd.hd_hash >= 337 and hd.hd_hash <= 737
;
