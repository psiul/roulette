select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 265 and ss.ss_hash <= 465 and c.c_hash >= 488 and c.c_hash <= 588 and hd.hd_hash >= 817 and hd.hd_hash <= 867
;
