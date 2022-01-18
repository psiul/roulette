select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 513 and ss.ss_hash <= 846 and cd.cd_hash >= 533 and cd.cd_hash <= 933 and c.c_hash >= 5 and c.c_hash <= 755
;
