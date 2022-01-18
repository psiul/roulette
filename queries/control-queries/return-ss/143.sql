select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 78 and ss.ss_hash <= 828 and c.c_hash >= 321 and c.c_hash <= 721 and i.i_hash >= 123 and i.i_hash <= 456
;
