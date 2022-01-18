select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 171 and c.c_hash <= 921 and i.i_hash >= 304 and i.i_hash <= 637 and hd.hd_hash >= 525 and hd.hd_hash <= 925
;
