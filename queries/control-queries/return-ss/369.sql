select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 586 and ss.ss_hash <= 986 and c.c_hash >= 438 and c.c_hash <= 771 and cd.cd_hash >= 81 and cd.cd_hash <= 831
;
