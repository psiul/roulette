select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 765 and hd.hd_hash <= 865 and cd.cd_hash >= 677 and cd.cd_hash <= 697 and c.c_hash >= 868 and c.c_hash <= 918
;
