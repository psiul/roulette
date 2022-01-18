select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 233 and c.c_hash <= 733 and hd.hd_hash >= 94 and hd.hd_hash <= 294 and i.i_hash >= 506 and i.i_hash <= 606
;
