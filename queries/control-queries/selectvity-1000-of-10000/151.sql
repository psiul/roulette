select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 1 and ss.ss_hash <= 751 and cd.cd_hash >= 365 and cd.cd_hash <= 698 and c.c_hash >= 443 and c.c_hash <= 843
;
