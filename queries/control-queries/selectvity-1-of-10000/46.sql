select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 31 and ss.ss_hash <= 51 and cd.cd_hash >= 574 and cd.cd_hash <= 624 and hd.hd_hash >= 857 and hd.hd_hash <= 957
;