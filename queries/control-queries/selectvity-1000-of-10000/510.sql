select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 47 and ss.ss_hash <= 797 and c.c_hash >= 255 and c.c_hash <= 655 and i.i_hash >= 504 and i.i_hash <= 837
;
