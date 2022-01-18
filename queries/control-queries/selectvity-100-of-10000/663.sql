select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 699 and ss.ss_hash <= 799 and i.i_hash >= 332 and i.i_hash <= 532 and hd.hd_hash >= 316 and hd.hd_hash <= 816
;
