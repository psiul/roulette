select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 276 and ss.ss_hash <= 609 and i.i_hash >= 579 and i.i_hash <= 979 and cd.cd_hash >= 108 and cd.cd_hash <= 858
;
