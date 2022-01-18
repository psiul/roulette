select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 438 and ss.ss_hash <= 771 and i.i_hash >= 14 and i.i_hash <= 764 and c.c_hash >= 272 and c.c_hash <= 672
;
