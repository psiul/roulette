select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 620 and ss.ss_hash <= 670 and cd.cd_hash >= 152 and cd.cd_hash <= 172 and i.i_hash >= 39 and i.i_hash <= 139
;
