select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 586 and ss.ss_hash <= 686 and c.c_hash >= 1 and c.c_hash <= 51 and hd.hd_hash >= 96 and hd.hd_hash <= 296
;
