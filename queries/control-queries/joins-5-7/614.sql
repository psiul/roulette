select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 159 and ss.ss_hash <= 559 and i.i_hash >= 216 and i.i_hash <= 549 and cd.cd_hash >= 36 and cd.cd_hash <= 786
;
