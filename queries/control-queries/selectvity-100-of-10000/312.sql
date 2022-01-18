select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 556 and ss.ss_hash <= 756 and cd.cd_hash >= 238 and cd.cd_hash <= 738 and c.c_hash >= 160 and c.c_hash <= 260
;
