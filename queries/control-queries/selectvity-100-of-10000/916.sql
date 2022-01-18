select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 656 and cd.cd_hash <= 756 and hd.hd_hash >= 742 and hd.hd_hash <= 942 and c.c_hash >= 391 and c.c_hash <= 891
;
