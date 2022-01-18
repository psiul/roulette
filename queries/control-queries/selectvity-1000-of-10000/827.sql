select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 121 and ss.ss_hash <= 871 and c.c_hash >= 150 and c.c_hash <= 483 and hd.hd_hash >= 224 and hd.hd_hash <= 624
;
