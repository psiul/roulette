select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 184 and c.c_hash <= 584 and cd.cd_hash >= 61 and cd.cd_hash <= 811 and i.i_hash >= 202 and i.i_hash <= 535
;
