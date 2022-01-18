select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 181 and ss.ss_hash <= 681 and hd.hd_hash >= 24 and hd.hd_hash <= 224 and i.i_hash >= 356 and i.i_hash <= 456
;
