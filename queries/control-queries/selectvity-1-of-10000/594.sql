select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 604 and ss.ss_hash <= 704 and cd.cd_hash >= 901 and cd.cd_hash <= 921 and hd.hd_hash >= 924 and hd.hd_hash <= 974
;
