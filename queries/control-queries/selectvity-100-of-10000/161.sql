select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 159 and ss.ss_hash <= 659 and i.i_hash >= 807 and i.i_hash <= 907 and cd.cd_hash >= 68 and cd.cd_hash <= 268
;
