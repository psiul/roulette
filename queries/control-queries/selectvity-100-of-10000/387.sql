select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 134 and ss.ss_hash <= 234 and c.c_hash >= 513 and c.c_hash <= 713 and cd.cd_hash >= 494 and cd.cd_hash <= 994
;
