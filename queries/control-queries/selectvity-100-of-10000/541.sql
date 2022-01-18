select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 165 and cd.cd_hash <= 665 and i.i_hash >= 117 and i.i_hash <= 217 and c.c_hash >= 503 and c.c_hash <= 703
;
