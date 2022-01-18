select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 66 and hd.hd_hash <= 466 and cd.cd_hash >= 98 and cd.cd_hash <= 848 and i.i_hash >= 642 and i.i_hash <= 975
;
