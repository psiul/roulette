select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 184 and ss.ss_hash <= 584 and c.c_hash >= 0 and c.c_hash <= 750 and hd.hd_hash >= 46 and hd.hd_hash <= 379
;
