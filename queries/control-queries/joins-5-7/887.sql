select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 184 and ss.ss_hash <= 584 and cd.cd_hash >= 195 and cd.cd_hash <= 945 and i.i_hash >= 206 and i.i_hash <= 539
;
