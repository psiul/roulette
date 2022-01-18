select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 49 and ss.ss_hash <= 799 and cd.cd_hash >= 46 and cd.cd_hash <= 379 and hd.hd_hash >= 175 and hd.hd_hash <= 575
;
