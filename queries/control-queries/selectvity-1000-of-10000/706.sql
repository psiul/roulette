select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 18 and ss.ss_hash <= 768 and c.c_hash >= 100 and c.c_hash <= 433 and cd.cd_hash >= 187 and cd.cd_hash <= 587
;
