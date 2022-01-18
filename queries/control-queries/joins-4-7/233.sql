select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 660 and c.c_hash <= 993 and i.i_hash >= 185 and i.i_hash <= 935 and hd.hd_hash >= 360 and hd.hd_hash <= 760
;
