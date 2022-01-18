select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 370 and hd.hd_hash <= 570 and c.c_hash >= 392 and c.c_hash <= 892 and i.i_hash >= 134 and i.i_hash <= 234
;
