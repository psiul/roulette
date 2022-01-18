select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 5 and c.c_hash <= 405 and cd.cd_hash >= 223 and cd.cd_hash <= 973 and hd.hd_hash >= 102 and hd.hd_hash <= 435
;
