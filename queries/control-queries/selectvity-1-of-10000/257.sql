select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 701 and ss.ss_hash <= 801 and i.i_hash >= 60 and i.i_hash <= 80 and c.c_hash >= 158 and c.c_hash <= 208
;
