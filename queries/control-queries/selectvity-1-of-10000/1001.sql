select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 728 and ss.ss_hash <= 828 and c.c_hash >= 340 and c.c_hash <= 390 and i.i_hash >= 840 and i.i_hash <= 860
;
