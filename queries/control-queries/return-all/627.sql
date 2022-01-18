select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 504 and ss.ss_hash <= 837 and i.i_hash >= 223 and i.i_hash <= 973 and cd.cd_hash >= 31 and cd.cd_hash <= 431
;
