select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 572 and ss.ss_hash <= 622 and c.c_hash >= 171 and c.c_hash <= 371 and hd.hd_hash >= 558 and hd.hd_hash <= 658
;
