select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 141 and ss.ss_hash <= 341 and c.c_hash >= 492 and c.c_hash <= 992 and cd.cd_hash >= 611 and cd.cd_hash <= 711
;
