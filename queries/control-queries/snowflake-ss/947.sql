select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 369 and hd.hd_hash <= 769 and c.c_hash >= 153 and c.c_hash <= 903 and i.i_hash >= 65 and i.i_hash <= 398
;
