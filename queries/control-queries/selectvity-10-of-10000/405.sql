select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 52 and ss.ss_hash <= 152 and i.i_hash >= 556 and i.i_hash <= 756 and c.c_hash >= 301 and c.c_hash <= 351
;
