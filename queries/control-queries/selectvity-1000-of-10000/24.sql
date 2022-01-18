select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 163 and c.c_hash <= 913 and cd.cd_hash >= 109 and cd.cd_hash <= 509 and hd.hd_hash >= 214 and hd.hd_hash <= 547
;
