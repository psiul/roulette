select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 187 and ss.ss_hash <= 937 and cd.cd_hash >= 132 and cd.cd_hash <= 465 and i.i_hash >= 135 and i.i_hash <= 535
;
