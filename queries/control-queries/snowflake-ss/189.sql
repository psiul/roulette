select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 222 and ss.ss_hash <= 972 and c.c_hash >= 353 and c.c_hash <= 686 and i.i_hash >= 238 and i.i_hash <= 638
;
