select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 387 and c.c_hash <= 787 and hd.hd_hash >= 238 and hd.hd_hash <= 988 and i.i_hash >= 3 and i.i_hash <= 336
;
