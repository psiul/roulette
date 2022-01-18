select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 287 and ss.ss_hash <= 387 and i.i_hash >= 2 and i.i_hash <= 502 and hd.hd_hash >= 734 and hd.hd_hash <= 934
;
