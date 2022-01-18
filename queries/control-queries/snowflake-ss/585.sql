select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 279 and i.i_hash <= 612 and c.c_hash >= 119 and c.c_hash <= 869 and cd.cd_hash >= 437 and cd.cd_hash <= 837
;
