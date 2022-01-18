select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 287 and ss.ss_hash <= 620 and hd.hd_hash >= 209 and hd.hd_hash <= 609 and i.i_hash >= 6 and i.i_hash <= 756
;
